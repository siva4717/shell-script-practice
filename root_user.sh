#?/bin/bash

#check the root user exist or not

start_time="$(date %F.m.d.H.M.S)"
user_id=$(id -u)

echo "root user: $user_id"

if [ $user_id -ne 0 ]; then
    echo "please use the root user"
    exit 1
else
    echo "you are connecting root user"
fi

echo "root user:$user_id"
END_time="$(date %F.m.d.H.M.S)
TOTAL_TIME=$END_time-$start_time