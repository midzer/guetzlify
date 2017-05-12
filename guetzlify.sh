#!/bin/sh
###################################################################################################
#
# guetzlify.sh - Shell Script to Recompress Images with guetzli
#
# This script creates recompressed version of the original file
# by overwritting it. JPG and PNG are supported input file types.
# You can specify an image quality for the conversion.
#
# Author: Dennis Rohner
# URL: https://github.com/midzer/guetzlify
#
# License: MIT
#
# Version 0.1
#
###################################################################################################

# Enter "/path/to/guetzli"
guetzli="/usr/local/bin/guetzli"

# Enter "/path/to/convert"
convert="/usr/bin/convert"

# Set quality [84-100]
quality=95

# Determine size of original file
origFile="$1"
origFileSize=$(stat -c %s "$origFile")

# Temporary .png file
pngFile=$origFile".png"

# Convert to .png first to support progressive .jpg in any case
echo "Processing $origFile ..."
$convert "$origFile" "$pngFile"

$guetzli --quality $quality "$pngFile" "$origFile"
guetzlifiedFileSize=$(stat -c %s "$origFile")
percent=$((100 - guetzlifiedFileSize * 100 / origFileSize))
percent=$( printf '%d' $percent )

result="File size reduced by "
result=$result$percent
result="$result percent"
echo $result

# Clean up .png
if [ -f "$pngFile" ]
then
	rm -f "$pngFile"
fi
