# find_diff.sh
# Steve Willson
# 24 July 2018
#
# first argument - text file with strings each on a new line
# second argument - text file with strings to search for in first argument
# search for occurances of strings in the second file in the first file
# output the line number in the first file that the string occurs on
# example find_diff.sh FILE1 FILE2

ORIGFILE=$1
SEARCHFILE=$2

DEBUG=0

if [ $# -ne 2 ]; then
    echo "usage: find_diff.sh FILE1 FILE2"
    exit
fi

if [ "$DEBUG" -eq 1 ]; then 
    echo "Debug mode on"
    echo "Using original file $ORIGFILE"
    echo "Using search file $SEARCHFILE"
fi

for TERM in $(cat $SEARCHFILE); do
    [ "$DEBUG" -eq 1 ] && echo "searching for $TERM";

    OUTPUT=$(grep -n $TERM $ORIGFILE)
    [ "$DEBUG" -eq 1 ] && echo $OUTPUT

    LINE_NUM=$(echo $OUTPUT | cut -d":" -f1)
    [ "$DEBUG" -eq 1 ] && echo "line number is $LINE_NUM"

    if [ $LINE_NUM ]; then
        echo "Found $TERM in $ORIGFILE at line $LINE_NUM";
    else
        echo "$TERM is NOT in $ORIGFILE";
    fi   
done
    
