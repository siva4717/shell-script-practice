#?/bin/bash
USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
FILE_LOG_DIRECTORY="/var/log/shell-script/"
SCRIPT_NAME=$(echo $0 | cut -d '.' -f1)
FILE_LOG=$FILE_LOG_DIRECTORY/$SCRIPT_NAME.log
mkdir -p $FILE_LOG_DIRECTORY 
echo -e "$G The script Started at ::: $(date)$N"

if [ $USER_ID -ne 0 ]; then 
    echo -e " $R You can use root user $N" 
    exit 1
    
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e " ERROR::$2 installing $R failure $N "
    else
        echo -e " $2 installing $G success $N "
    fi
}
dnf list installed mysql &>>$FILE_LOG
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$FILE_LOG
    VALIDATE $? "MYSQL" 
else 
    echo -e "MYSQL is already installed $Y Skip $N" | tee -a $FILE_LOG
fi
dnf list installed nginx &>>$FILE_LOG
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$FILE_LOG 
    VALIDATE $? "NGINX"  
else 
    echo -e "NGINX is alredy installed $Y Skip $N" | tee -a $FILE_LOG
fi
dnf list installed python3 &>>$FILE_LOG
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$FILE_LOG
    VALIDATE $? "PYTHON3"
else 
    echo -e "PYTHON3 is alredy installed $Y Skip $N" | tee -a $FILE_LOG
fi
