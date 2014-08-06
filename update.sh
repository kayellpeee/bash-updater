#! /bin/bash

# This script will pull upstream changes from a specefied repo when provided with the right code.
# If it fails it will check again in 5 minutes—you can use crontab to set it up to run once a day
# designed to automate daily pull requests without navigating into the repo and typing git pull


# enter the path of the repo you want to update
repo="/Users/..."

# enter whatever name you save this script file as
# if you don't put this script in usr/local/bin then make sure to include the file path
# the variable is used to call itself again on line 32 in case of a failure
file="update.sh"

# the message you get if git pull fails
fail="Already up-to-date."

# your passcode
launchCode=11111

echo "Attempting to update" $repo
echo -e "please enter proper launch code"
read -s enteredCode
if [ $enteredCode -eq $launchCode ]; then 
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
else
	echo "improper launch code" $enteredCode
fi

