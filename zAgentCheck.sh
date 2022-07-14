#!/bin/bash
scp *:*.txt .
declare -i ready=0
declare -i active=0
declare -i agents=0 
ready="$(grep -i -w "READY" *.txt | wc -l)"
active="$(grep -i -w "ACTIVE" *.txt | wc -l)"
agents=$ready+$active
if [ $agents -ge 8 ]
then 
exit 0
fi
/bin/echo "Subject: Check" '' | cat - *.txt | /usr/lib/sendmail -f user@user.com -t to_user@user.com
