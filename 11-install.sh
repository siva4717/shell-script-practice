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