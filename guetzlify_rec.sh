#!/bin/sh
###################################################################################################
#
# guetzlify_rec.sh - Shell Script to Recursively Recompress Images with guetzli
#
# This script looks for compressible files in a directory and uses the guetzlify.sh script to 
# create recompressed .jpg images.
#
# Author: Dennis Rohner
# URL: https://github.com/midzer/guetzlify
#
# License: MIT
#
# Version 0.1
#
###################################################################################################

# Enter "/path/to/guetzlify.sh" script
guetzlify="./guetzlify.sh"

# Define, which files are to be compressed
compressible="jpg|jpeg|png"

# Enter directory to start (recursively) looking for compressible files
dir="/var/www/html"

find $dir -regextype posix-extended -regex ".*\.($compressible)" -exec sh -x $guetzlify {} \;
