#!/bin/bash
## get total free memory size in megabytes(MB)
#Swap and phyical memory
#free=$(free -mt | grep Total | awk '{print $4}')
#just phyical memory check
box=$1
#ssh $box free=$(free -mt | grep 'Mem:' | awk '{print $7}')
free=$(ssh $box free -mt | grep 'Mem:' | awk '{print $7}')

## check if free memory is less or equals to  1000MB
if [[ "$free" -le 1000  ]]; then
        ## get top processes consuming system memory and save to temporary file
        ssh $box ps aux --sort=-%mem | head >/tmp/top_proccesses_consuming_memory.txt

        file=/tmp/top_proccesses_consuming_memory.txt
        ## send email if system memory is running low
        /bin/echo "Subject: " $box " Warning, server memory is running low! Free memory: $free MB"  ''| cat - /tmp/top_proccesses_consuming_memory.txt | /usr/lib/sendmail -f user@user.co.za -t user@user.co.za
else
	date
	echo $box" memory ok"
fi

exit 0


