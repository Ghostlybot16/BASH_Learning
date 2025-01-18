#!/bin/bash

# Testing for loop from the book 

# for loop outputs values from 0 to 3
for b in {0..3}; do                          
	
	# FIRST stores each output of the for loop integers with the string Number
	# ex: Number 0, Number 1, Number 2
	FIRST="Number $b"

	# SECOND uses the string value of FIRST and utilizes the pipe command to find the stings word count as well
	# The echo command uses "-n" to ignore new lines that the wc command picks up
	SECOND=$(echo -n "$FIRST" | wc -c)

	echo "$FIRST : $SECOND" # Final output message
done

for i in {1..5}; do
	ONE="Iteration $i"
	TWO=$(echo -n "$ONE" | wc -c)

	echo "$ONE : $TWO"

done
