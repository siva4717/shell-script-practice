#?/bin/bash
USER_ID=$(id -u)
R="/e[31m"
G="/e[32m"
N="/e[0m"
if [ $USER_ID -ne 0 ]; then 
    echo -e "$R You can use root user $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "ERROR::$2 installing $R failure $N"
    else
        echo -e "$2 installing $G success $N"
    fi
}

dnf install mysql -y
VALIDATE $? "MYSQL"
dnf install nginx -y
VALIDATE $? "NGINX"
dnf install python3 -y
VALIDATE $? "PYTHON3"