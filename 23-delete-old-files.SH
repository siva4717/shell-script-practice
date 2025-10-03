user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo " use root privilage"
    # exit 1
fi



SOURCE_DIRECTORY="/home/ec2-user/shell-script-practice/"

if [ ! -d $SOURCE_DIRECTORY ]; then
    echo "the source directory does not exist"
    exit 1
fi

cd 
find_logs= $(find $SOURCE_DIRECTORY -name '*.log' type -f)


while IFS= read -r file_path
do 
    echo "the log files are $file_path"
    rm -rf $file_path
    echo "the deleted log files are $file_path"
done <<< $find_logs


