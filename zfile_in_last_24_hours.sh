ssh IP_ADDR find /folder/ -maxdepth 1 -type d -mtime -1 -ls > file_test.txt
if test -s file_test.txt ; then
exit 0
else
/bin/echo "Subject: No File received in last 24 hours" '' | cat - file_test.txt | /usr/lib/sendmail -f from_user@user.com -t to_user@user.com
fi

