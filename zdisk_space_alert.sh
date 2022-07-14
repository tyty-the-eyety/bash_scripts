ssh  IP_ADDR df -h > disk_space_test.txt
size="$(grep -w "Backups" disk_space_test.txt|grep -Eo '[0-9]{2}[%]'|grep -Po "^..")"
if [ $size -ge 90 ]; then
#echo $size
/bin/echo "Subject: Disk Space Alert" '' | cat - disk_space_test.txt | /usr/lib/sendmail -f user@user.com -t to_user@user.com
fi
