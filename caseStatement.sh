#!/bin/bash

#Learning switch case
#
#In a case statement the "|" operator acts as an OR (not logical/bitwise but the word or like in opt1 or opt1)  

case ${1,,} in 
	herbert | administrator)
		echo "Hello, you're the boss here!"
		;;
	help)
		echo "Just enter your username!"
		;;
	*)
		echo "Hello there, you're not the boss of me. Enter a valid username!"
esac
