#!/bin/bash

# Variables in BASH are global by default unless explicitely made local
# If a function assigns a new value to a global variable, that change persists even after the function finishes executing

up="Before"
since="Function"

echo $up
echo $since

showUpTime(){
	
	# This variable assignment changes the values of the 2 variables from Before (up), Function (since) to the new values
	up=$(uptime -p | cut -c4-)
	since=$(uptime -s)
	cat << EOF
-----
This machine has been up for ${up}
It has been running since ${since}
-----
EOF
}
showUpTime

# These variables get overwritten by the function because the variables in the function were not localized to that function
echo $up
echo $since
