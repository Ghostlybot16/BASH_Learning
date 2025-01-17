#!/bin/bash

# Variables in BASH are global by default, they turn local once the local keyword is utilized within a function 

up="Before"
since="Function"

# Values stay as Before and Function
echo $up 
echo $since


showUpTime(){
	
	# The variables up and since share the same name as the global variable outside the scope of this function 
	# however using the local keyword makes it so that the variable values are local to this function 
	# and it does not change the value of it outside this function. 

	local up=$(uptime -p | cut -c4-)
	local since=$(uptime -s)
	cat << EOF
-----
This machine has been up for ${up}
It has been running since ${since}
-----
EOF
}
showUpTime

# These variable values stay as Before (up) and Function (since) because the function does not alter its values since the 
# function uses the keyword called local
echo $up
echo $since
