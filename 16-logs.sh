#?/bin/bash
#check root user
USER_ID=$(id -u)

#to create logs
FILE_LOG_DIRECTORY="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d '.' -f1)
LOG_FILE=$FILE_LOG_DIRECTORY/$SCRIPT_NAME.log

#colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USER_ID -ne 0 ]; then
    echo -e "please run the script with $R root privelege $N"
    exit 1
fi



#to create function for validating to the packages

VALIDATE(){ #functions are recieve inputs through arguments just like shell script
    if [ $1 -ne 0 ]; then
        echo -e "Erorr:Installing $2 ...$R failure $N"
    else
        echo -e "Installing $2 ... $G success $N"
    fi
}

mkdir -p $LOG_FILE
VALIDATE $? "$LOG_FILE" | tee -a $LOG_FILE
#check the if package is installed or not
dnf list installed mysql 
if [ $? -ne 0 ]; then 
    dnf install mysql -y &>> $LOG_FILE
    VALIDATE $? "mysql" | tee -a $LOG_FILE
else
    echo -e "mysql is already installed $Y SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then 
    dnf install nginx -y &>> $LOG_FILE
    VALIDATE $? "nginx" | tee -a $LOG_FILE
else
    echo -e "mysql is already installed $Y SKIPPING $N"
fi

dnf list installed python 
if [ $? -ne 0 ]; then 
    dnf install python  -y &>> $LOG_FILE
    VALIDATE $? "python " | tee -a $LOG_FILE
else
    echo -e "python  is already installed $Y SKIPPING $N"
fi

