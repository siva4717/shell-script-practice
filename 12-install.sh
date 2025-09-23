#?/bin/bash
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then 
    echo "You can use root user"
    exit 1
fi
dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "Erorr::mysql install failure"
else
    echo "MYSQL install success"
fi
dnf install nginx -y
if [ $? -ne 0 ]; then
    echo "Erorr::nginx install failure"
else
    echo "Nginx install success"
fi
dnf install python3 -y
if [ $? -ne 0 ]; then
    echo "Erorr::Python3 install failure"
else
    echo "Python3 install success"
fi