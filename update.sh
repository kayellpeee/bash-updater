#! /bin/bash

# enter the path of the repo you want to update
repo="/Users/..."

# enter whatever name you save this script file as
# if you don't put this script in usr/local/bin then make sure to include the file path
# the variable is used to call itself again on line 28 in case of a failure
file="update.sh"

# the message you get if there are no changes yet
fail="Already up-to-date."

echo "Attempting to update" $repo
cd "$repo"
echo "Checking" $repo "for updates"
outpt=$(git pull upstream master)
#if fail try again in 5 minutes
if [ "$outpt" = "$fail" ]; then
	echo 'Will try again in 5  minutes'
	sleep 300 && $file
else
	echo "successfully updated" $repo
fi
