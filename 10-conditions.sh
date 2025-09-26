#?/bin/bash
NUMBER=$1
if [ $NUMBER < 10 ]; then 
    echo "The given number $NUMBER is lessthan to 10"
elif [ $NUMBER == 10 ]; then
    echo "The given number $NUMBER is equal to 10"
else
    echo "The given number $NUMBER is greaterthan 10"
fi

# -lt -->lessthan
# -gt -->greaterthan
# -eq -->equal
# -ne -->not equal