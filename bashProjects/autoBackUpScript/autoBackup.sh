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

# Create the backup using the source directory name
tar -czf $BACKUP_COMMAND $SOURCE_FOLDER

# Backup success message 
echo "Backup of $SOURCE_FOLDER created successfully: $BACKUP_COMMAND"

# Call the delete_old_backups function from the sources library 
delete_old_backups "$DESTINATION_FOLDER"

