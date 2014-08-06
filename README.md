bash-updater
============

 This script will pull upstream changes from a specefied repo when provided with the right pass code.
 If it fails it will check again in 5 minutes—you can use crontab to set it up to run once a day.
 Designed to automate daily pull requests without navigating into the repo and typing git pull
