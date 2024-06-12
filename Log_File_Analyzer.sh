LOG_FILE="/var/log/nginx/access.log"
OUTPUT_FILE="/var/log/log_analyzer_report.log"

ERROR_404=$(grep " 404 " $LOG_FILE | wc -l)

MOST_REQUESTED=$(awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -nr | head -10)

TOP_IPS=$(awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head -10)

echo "Log Analysis Report" > $OUTPUT_FILE
echo "===================" >> $OUTPUT_FILE
echo "404 Errors: $ERROR_404" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE
echo "Most Requested Pages:" >> $OUTPUT_FILE
echo "$MOST_REQUESTED" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE
echo "Top IP Addresses:" >> $OUTPUT_FILE
echo "$TOP_IPS" >> $OUTPUT_FILE
