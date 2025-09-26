#?/bin/bash
#check root user
USER_ID=$(id -u)
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

#check the if package is installed or not
dnf list installed mysql 
if [ $? -ne 0 ]; then 
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo "mysql is already installed $Y SKIPPING $N"
fi

dnf list installed nginx 
if [ $? -ne 0 ]; then 
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "mysql is already installed $Y SKIPPING $N"
fi

dnf list installed python 
if [ $? -ne 0 ]; then 
    dnf install python  -y
    VALIDATE $? "python "
else
    echo "python  is already installed $Y SKIPPING $N"
fi

