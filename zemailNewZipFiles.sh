scp $1:/tmp/$(date '--rfc-3339=date')* .
(NEWDIR=/new_files/
NEWFILENAME=$(date '--rfc-3339=date')NEWFILES.zip
echo "to: user@user.com"
echo "subject: New files"
echo "mime-version: 1.0"
echo "Content-Type:multipart/related; boundary=\"messageBoundary\"";
echo
echo "--messageBoundary";
echo "Content-Type: application\zip";
echo "Content-Transfer-Encoding: uuencode";
echo "Content-Disposition: attachment;filename=\"$NEWFILENAME\"";
uuencode "$NEWDIR""$NEWFILENAME" $(date '--rfc-3339=date')NEWFILES.zip
echo "--messageBoundary";) | /usr/sbin/sendmail -f from_user@user.com -t to_user@user.com
