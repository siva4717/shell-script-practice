#?/bin/bash
echo "All variables passed to the script:$@"
echo "All variables passed to the script:$*"
echo "Script name:$0"
echo "current directory:$pwd"
echo "who is running this:$user"
echo "Home directory of user:$home"
echo "PID of this script:$$"
sleep 50 &
echo "PID of the last command of background is:$!"

echo "$@"
echo "$*"
echo "$0"
echo "$PWD"
echo "$USER"
echo "$HOME"
echo "$$"
echo "$!"
