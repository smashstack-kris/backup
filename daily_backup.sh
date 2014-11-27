#!/bin/bash

#Set Path relative to script where you have the Bitbucket/Git repository
path="./../"

#Set Database Settings
db_name="db_name"
db_user="db_user"
db_password="db_password"
db_host="localhost"


#NO NEED TO CHANGE ANYTHING BELOW THIS LINE
############################################

#prepare Dump file anme
file_name=$db_name-autobackup.sql

#Change Directory to the Repo folder
cd $path

#Dump the Database
mysqldump -h $db_host --user=$db_user --password=$db_password $db_name > $file_name

#Add any new files and modified files to stage
git add -A

#commit  changes
msg=`git commit -m "Auto commit by cron"`

#Push the changes committed -q for quite push operation
git push origin master -q

#All Done now remove the DB dump file from local
rm -rf $file_name

