user_id=$(id)

if [ $user_id -ne 1 ] : then
    echo " use root privilage"
    exit 1;
fi 

SOURCE_DIRECTORY="/var/log/ansible_logs"

if [ ! -d $SOURCE_DIRECTORY ] : then
    echo "the source directory does not exist"
    exit 1;
fi

find_logs= $(find $SOURCE_DIRECTORY -name '*.log')


while IFS=read -r file_path
do 
    echo "the log files are $file_path"
    rm -rf $file_path
    echo "the deleted log files are $file_path"
done <<< $find_logs


