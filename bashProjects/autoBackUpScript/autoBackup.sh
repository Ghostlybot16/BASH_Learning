#!/bin/bash

# Import the library containing the delete function 
source ./autoBackup_Utils/backUpDel.sh

#Check to see if user provided the required number of arguments
# "$#" is used to check to see if the command line arguments are less than 2 
if [ $# -lt 2 ]; then
	echo "Error: Missing 2 arguments."
	echo "Correct Usage: $0 <source_directory> <destination_directory>"
	exit 1
fi

# Assign command line arguments to the respective variables 

SOURCE_FOLDER=$1 # The directory which is being backedup
DESTINATION_FOLDER=$2 # The directory where the backup is stored 

# Define the path to the log file
# It will be placed within the same directory as the backup files (DESTINATION_FOLDER) 
LOG_FILE="$DESTINATION_FOLDER/backup.log"

# Check to see if the source directory exists and is valid 
if [ ! -d "$SOURCE_FOLDER" ]; then
	echo "Error: Source directory '$SOURCE' does not exist."
	exit 1
fi

# Check to see if the destination directory exists, if not then create it
if [ ! -d "$DESTINATION_FOLDER" ]; then
	echo "Destination directory '$DESTINATION_FOLDER' does not exist."
	echo "Creating destination directory..."
	mkdir -p "$DESTINATION_FOLDER" # Creates destination folder as parent 
fi

#Define the backup filename with a timestamp 
BACKUP_COMMAND="$DESTINATION_FOLDER/backup_$(date +"%y-%b%d_%H-%M-%S").tar.gz"

# Create the backup file 
# if block to check if the command runs successfully
if tar -czf "$BACKUP_COMMAND" "$SOURCE_FOLDER"; 
then
	# "tee" command does two things at once, logs the success message both in the terminal and in the log file. 
	echo "$(date +"%Y-%m-%d_%H-%M-%S") - Backup created: $BACKUP_COMMAND" | tee -a "$LOG_FILE"
else
	echo "$(date +"%Y-%m-%d_%H-%M-%S") - ERROR: Backup creation failed for $SOURCE_FOLDER" | tee -a "$LOG_FILE"
	exit 1
fi

# Call the delete_old_backups function from the sources library 
delete_old_backups "$DESTINATION_FOLDER" "$LOG_FILE"

