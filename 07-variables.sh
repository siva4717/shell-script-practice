#?/bin/bash

DATE=$(date)

echo "Today date:$DATE"

START_TIME=$(date +"%s")
sleep 5
END_TIME=$(date +"%s")
TOTAL_TIME=$(($END_TIME-$START_TIME))
echo "script executed in $TOTAL_TIME seconds"
