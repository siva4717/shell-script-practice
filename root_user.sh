#?/bin/bash

#check the root user exist or not

user_id=$id

if [ $? -ne 0 ]; then
    echo "please use the root user"
    exit 1
else
    echo "you are connecting root user"
fi

echo "root user"
