#?/bin/bash

#check root user
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "please run the script with root privelege"
    exit 1
fi

#install mysql package
dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Erorr:installing mysql is failure"
else
    echo "Installing mysql is success"
fi


