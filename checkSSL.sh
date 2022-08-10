#!/bin/bash
TARGET="127.0.0.1:443"; 
RECIPIENT="tyronesch@gmail.com";
DAYS=30;
echo "checking if $TARGET expires in less than $DAYS days";
expirationdate=$(date -d "$(: | openssl s_client -connect $TARGET -servername $TARGET 2>/dev/null \
                              | openssl x509 -text \
                              | grep 'Not After' \
                              |awk '{print $4,$5,$7}')" '+%s'); 
in7days=$(($(date +%s) + (86400*$DAYS)));
if [ $in7days -gt $expirationdate ]; then
    echo "KO - Certificate for $TARGET expires in less than $DAYS days, on $(date -d @$expirationdate '+%Y-%m-%d')" \ ; 
    # | mail -s "Certificate expiration warning for $TARGET" $RECIPIENT ;
else
    echo "OK - Certificate expires on $expirationdate  -- $TARGET";
fi;

#openssl s_client -connect bitbucket.org:443 2>/dev/null | openssl x509 -noout -enddate