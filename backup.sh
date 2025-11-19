#!/bin/bash
#Author: CHANDRA PRAKASH MISHRA
#Date:18/11/2025
#----BACKUP A SPECIFIC DIRECTORY TO A BACKUP FOLDER WITH A TIMESTAMP

#CHECK IF BOTH ARGUEMENTS ARE GIVEN OR NOT 
if [ $# -ne 2 ]; then
   echo "Usage : $0 <source_directory><backup_directory>"
   exit 1
fi

#ASSIGNING THE ARGUEMENTS TO THE VARIABLES
source=$1
backup=$2

#CHECK IF THE SOURCE DIRECTORY EXISTS OR NOT
if [ ! -d "$source" ];then
   echo "Error: source directory '$source' does not exist"
   exit 1
fi

#CREATING THE BACKUP DIRECTORY IF IT DOESN'T EXIST
if [ ! -d "$source" ];then
   mkdir -p "$backup"
fi

#GENERATING THE TIMESTAMP FOR THE BACKUP FOLDER NAME
timestamp=$(date +%Y%m%d%H%M%S)

#COPY THE SOURCE DIRECTORY TO THE BACKUP DIRECTORY WITH TIMESTAMP
cp -r "$source" "$backup/backup_$timestamp"

#CONFIRMING THE BACKUP COMPLETION
echo "backup of '$source' completed at '$backup/backup_$timestamp'"
