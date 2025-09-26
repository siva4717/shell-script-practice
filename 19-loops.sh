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
for package in $@
do
    echo "package is $package"
done