
# Function below gets called to delete old backups after 7 days have gone by and then prints out a confirmation message
delete_old_backups() {
	local backup_folder=$1
	local log_file=$2
	local max_days=7

	# Ensure the log file exists
	touch "$log_file"

	# Check if the backup folder exists 
	if [ ! -d "$backup_folder" ]; then

		# error message gets displayed both in the terminal and in the log file
		echo "Error: Backup folder '$backup_folder' does not exist." | tee -a "$log_file"
		return 1
	fi

	
	# Find and delete backup files that are older than 7 days
	# "find": This command searches for a file in the current directory
	# "-name": Matches files/directories by name
	# "backup_*.tar.gz": Looks for backup files
	# "-type f": Filters the search to only include files
	# "-mtime +$max_days": Filters files based on their modification time being greater than 7 days
	# "-exec": Executes command on each file that matches the criteria
	# "rm {}": rm deletes the file, {} gets replaced wit the file found by the find command
	# "\;": Marks the end of the exec command and it ensures that the find command processes the file one at a time
	find "$backup_folder" -name "backup_*.tar.gz" -type f -mtime +$max_days -exec rm -f {} \; -exec echo "$(date +"%Y-%m-%d %H:%M:%S") - Deleted: {}" >> "$log_file" \;

	# Confirmation message that gets printed to the terminal
	echo "$(date +"%Y-%m-%d %H-%M-%S") - Backups older than $max_days days have been deleted from '$backup_folder'." | tee -a "$log_file"   


}
