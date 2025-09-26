#?/bin/bash

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo "please run the script with root privelege"
    exit 1
fi

#to create function for validating to the packages

VALIDATE(){ #functions are recieve inputs through arguments just like shell script
    if [ $1 -ne 0 ]; then
        echo "Erorr:Installing $2 ... failure"
    else
        echo "Installing $2 ... success"
    fi
}

dnf install mysql -y
validate $? "mysql"

dnf install nginx -y
validate $? "nginx"

dnf install python -y
validate $? "python"
