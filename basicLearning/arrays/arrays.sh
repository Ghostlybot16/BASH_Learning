#!/bin/bash
#
#Learning arrays in BASH 

MY_LIST=(one two three four five)
echo $MY_LIST # This will only output the first value in the list 

# Using the "@" symbol prints out all the items of the array
# To interact with an array, it needs to be inside of the ${} curly brackets 
echo ${MY_LIST[@]}

# Arrays in BASH are index based and it is a 0th index array meaning the 1st element exists at index 0
echo ${MY_LIST[0]}



