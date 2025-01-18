#!/bin/bash

showName(){
	
	# Main output of the showName function
	echo Hello $1

	# the ",," double commas converts the input to all lowercase 
	if [ "${1,,}" = "kramptj" ]; then 
		return 0
	else
		return 1
	fi
}

# Validate that an argument is provided when calling the function 
if [ -z "$1" ]; then
	echo "Error: No name provided."
	exit 1
fi

# Call function
showName $1  

# Check the return value
if [ $? -eq 1 ]; then
	echo "Someone unknown called the function!"
fi

