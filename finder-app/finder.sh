#!/bin/bash

if [ $# -ne 2 ];
then
    echo "Error: 2 arguments required but $# provided"
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir="$1" # full path to a file (including filename) on the filesystem
searchstr="$2" # text string which will be written within this file

# Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory."
    exit 1
fi

# Prints a message "The number of files are X and the number of matching lines are Y"
# where X is the number of files in the directory and all subdirectories and Y is the number
# of matching lines found in respective files, where a matching line refers to a line which
# contains searchstr (and may also contain additional content).

# X is the number of files in the directory and all subdirectories
X=$(find "$filesdir" -type f | wc -l)

# Y is the number of matching lines found across those files
Y=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $X and the number of matching lines are $Y"

exit 0