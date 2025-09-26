#?/bin/bash

#check the root user exist or not

start_time=$(date +"%s")
user_id=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
script_name=$(echo $0 | cut -d '.' -f1)
FILE_LOG_DIRECTORY="/var/log/shell-script"
FILE_LOG=$FILE_LOG_DIRECTORY/$script_name.log
mkdir -p /var/log/shell-script
echo "script starting time is:$(date +"%F.%H.%M.%S")"
echo -e "$G user: $user_id $N"

if [ $user_id -ne 0 ]; then
    echo -e "please use the $R root user $N"
    exit 1
else
    echo -e "$G you are connecting root user $N"
fi
sleep 10
echo "root user:$user_id"


validate(){
    if [ $1 -ne 0 ]; then 
        echo -e "$package $R Erorr $N" -tee &>> $FILE_LOG
    else
        echo -e "Installing $package $G success $N" -tee &>> $FILE_LOG
    fi
}

for package in $@
do
    dnf list $package &>> $FILE_LOG
    if [ $? != 0 ]; then
        dnf install $package -y &>> $FILE_LOG
        validate $? "$package" -tee &>> $FILE_LOG
    else
        echo -e "$package is already installed $Y skip $N"
    fi
done

echo "$script_name"
END_time=$(date +"%s")
TOTAL_TIME=$(($END_time-$start_time))
echo -e "$G scrip running time:$TOTAL_TIME seconds $N"




