URL="http://yourapplication.com"
LOG_FILE="/var/log/app_health.log"

HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)

if [ $HTTP_STATUS -eq 200 ]; then
    echo "$(date): Application is up" >> $LOG_FILE
else
    echo "$(date): Application is down. Status code: $HTTP_STATUS" >> $LOG_FILE
fi
