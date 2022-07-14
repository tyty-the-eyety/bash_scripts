#!/bin/bash
# get the current date
date=$(date '+%Y-%m-%d')
# do a list of the files in the remote server 
/usr/bin/smbclient  '//*/E_DRIVE' -U user\password -c 'prompt ; l *.xlsx' > fileList.txt
#check if the file has a date with todays date from the above var
grep -irl $date FileList.txt > dateCheck.txt
if [ -s dateCheck.txt ]
then
        echo 'got a file match ' $date
		rm FileList.txt
		rm dateChecktxt
		exit 0 
else
        echo 'did not get a file match ' $date
		/bin/echo "Subject: File not Received $date" | /usr/lib/sendmail -f from_user@user.com -t to_user@user.com
		
fi

