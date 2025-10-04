#?/bin/bash\

# check user_id
USER_ID=$( id -u )

#colors
R='/e[31m'
G='/e[32m'
Y='/e[33m'
N='/e[38m'

# generate logs
LOG_DIRECTORY="/var/logs/shell-script-practice"
SCRIPT_NAME=$( echo "$0" | cut -d "." -f1 )
LOG_FILE=$LOG_DIRECTORY/$SCRIPT_NAME.log 

mkdir -p $LOG_DIRECTORY
echo "script start date and time is : $(date +"%H.%M.%S")" | tee -a $LOG_FILE

SCRIPT_DIRECTORY=/home/ec2-user/app_logs

if [ ! -d $SCRIPT_DIRECTORY ]; then
    echo -e "$R script directory does not exist $N"
    exit 1;
fi 

files_to_delete=$(find $SCRIPT_DIRECTORY -name "*.log" -type f )

while IFS= read -r file_path
do 
    echo "The available files are $file_path"
    rm -rf $file_path
    echo "The delted files are $file_path"
done <<< $files_to_delete

