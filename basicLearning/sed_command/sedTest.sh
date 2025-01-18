#!/bin/bash

#Create a text file called sedText.txt and store some text in that file 
echo "The fly flies like no other fly flies. A fly is an insect that has wings and a fly likes to eat leftovers." > sedText.txt

# Command to replace 'fly' with 'grasshoppers' (without modifying the original text)
echo "SED command to replace 'fly' with 'grasshoppers':"

# /s = substitute text 
# /g = make the changes global 
# /fly/grasshopper = sub fly with grasshopper
# apply the changes to the sedText.txt file 
sed '/s/fly/grasshopper/g' sedText.txt

# Create a backup of the original file and replace 'fly' with 'grasshopper'
sed -i.ORIGNAL 's/fly/grasshopper/g' sedText.txt

#Display the content of the 2 files modified and original 
echo -e "\nContents of sedText.txt (modified):"
cat sedText.txt

echo -e "\nContent of sedText.txt.ORIGINAL (backup of original file):"
cat sedText.txt.ORIGINAL
