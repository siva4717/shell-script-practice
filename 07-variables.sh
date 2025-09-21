#?/bin/bash

START_DATE=$(date +%s)
sleep 30
END_DATE=$(date +%s)
TOTAL_TIME=$(($END_DATE-$START_DATE))
echo "the process execution time is $TOTAL_TIME"
