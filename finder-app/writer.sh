#!/bin/bash

if [ $# -ne 2 ];
then
    echo "Error: 2 arguments required but $# provided"
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile="$1" # full path to a file (including filename) on the filesystem
writestr="$2" # text string which will be written within this file

# Creates a new file with name and path writefile with content writestr,
# overwriting any existing file and creating the path if it doesn't exist.
if [ ! -d "$(dirname "$writefile")" ];
then
    mkdir -p "$(dirname "$writefile")"
fi

touch "$writefile"

# Exits with value 1 and error print statement if the file could not be created.
if [ ! -f "$writefile" ]; then
    echo "Error: Failed to create file $writefile"
    exit 1
fi

# Write the content to the file
echo "$writestr" > "$writefile"

exit 0
