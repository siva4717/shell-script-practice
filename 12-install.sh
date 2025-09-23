#?/bin/bash
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then 
    echo "You can use root user"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "ERROR::$2 installing failure"
    else
        echo "$2 installing success"
}

dnf install mysql -y
VALIDATE $? "MYSQL"
dnf install nginx -y
VALIDATE $? "NGINX"
dnf install python3 -y
VALIDATE $? "PYTHON3"