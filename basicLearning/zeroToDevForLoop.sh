#!/bin/bash

# Testing for loop from the book 

for b in {0..3}; do
	echo "Number $b"
	echo -n "Number $b" | wc -c
done

for i in {1..5}; do
	echo "Iteration $i"
done
