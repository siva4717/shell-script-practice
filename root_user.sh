#?/bin/bash

#check the root user exist or not

start_time=$(date +"%s")
user_id=$(id -u)
echo "script starting time is:$(date +"%F.%H.%M.%S")"
echo "user: $user_id"

if [ $user_id -ne 0 ]; then
    echo "please use the root user"
    exit 1
else
    echo "you are connecting root user"
fi
sleep 10
echo "root user:$user_id"
END_time=$(date +"%s")
TOTAL_TIME=$(($END_time-$start_time))
echo "scrip running time:$TOTAL_TIME seconds"




validate(){
    if [ $1 -ne 0 ]; then 
        echo "$package Erorr"
    else
        echo "Installing $package success"
    fi
}

for package in $@
do
    dnf install $package -y 
    validate $? "$package"
done



