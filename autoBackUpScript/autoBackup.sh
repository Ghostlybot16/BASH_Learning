#!/bin/bash

#Define the folder to backup 
SOURCE_FOLDER="testFolder"

#Define the backup filename with a timestamp 
BACKUP_COMMAND="backup_$(date +"%y-%b%d_%H-%M-%S").tar.gz"

# Create the backup
tar -czf $BACKUP_COMMAND $SOURCE_FOLDER

# Backup success message 
echo "Backup of $SOURCE_FOLDER created successfully: $BACKUP_COMMAND"

# Delete backup files that are older than 7 days 
# "find .": This command searches for a file in the current directory 
# "-name": matches files/directories by name 
# "backup_*.tar.gz": looks for backup files 
# "-type f": filters the search to only include files 
# "-mtime +7": filters files based on their modification time being greater than 7 days 
# "-exec": executes command on each file that matches the criteria 
# "rm {}": rm deletes the file, {} gets replaced wit the file found by the find command 
# "\;": marks the end of the exec command and it ensures that the find command processes the file one at a time 
find . -name "backup_*.tar.gz" -type f -mtime +7 -exec rm {} \;

# Confirmation message that gets printed to the terminal
echo "Backup files older than 7 days have been deleted"
