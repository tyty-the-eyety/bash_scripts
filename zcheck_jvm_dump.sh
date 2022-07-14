#!/bin/bash
box=$1
lastError="$(cat /Software/JdP/Checks/"$box"_jvmdump.txt)"
rm "$box"_jvmdump.txt
jvmdump=$(ssh $box cat /var/log/syslog | grep JVMDUMP |tail -1 |cut -c1-138)
echo $jvmdump >  "$box"_jvmdump.txt
if test -s "$box"_jvmdump.txt ; then
thisError="$(cat "$box"_jvmdump.txt)"
else
exit 0
fi
if [ "$thisError" = "$lastError" ] ; then
exit 0
else
#echo $jvmdump
/bin/echo "Subject: " $box " Warning, JVM Error"  ''| cat - "$box"_jvmdump.txt | /usr/lib/sendmail -f user@user.com -t user@user.com
fi


