/usr/bin/scp *.*.*.*:/*/*.txt .
/bin/echo '' | cat - *.txt > ./*.check
if test -s **.txt ; then
exit 0
else
/bin/echo "Subject: * NOT Received" '' | cat - *.check | /usr/lib/sendmail -f user@user.com -t user@user.com
fi
