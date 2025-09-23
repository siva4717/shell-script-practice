#?/bin/bash
NUMBER=$1
if [$NUMBER -lt 10]; then
    echo "The given number $1 is lessthan 10"
else
    echo "The given number $1 is greater than or equal to 10"
fi