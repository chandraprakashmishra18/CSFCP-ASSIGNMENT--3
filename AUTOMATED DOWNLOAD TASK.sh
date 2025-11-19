#!/bin/bash
# DOWNLOAD A FILE FROM THE INTERNET AND SAVE IT TO A SPECIFIED LOCATION
# AUTHOR: CHANDRA PRAKASH MISHRA
# DATE: 18/11/2025

# CHECK IF BOTH THE ARGUEMENTS ARE GIVEN OR NOT
if [ $# -ne 2 ]; then
  echo "Usage: $0 <url> <destination>"
  exit 1
fi

# ASSIGNING THE ARGUEMENTS TO THE VARIABLES
url=$1
destination=$2

# DOWNLOAD THE FILE USING THE WGET COMMAND
wget -O "$destination" "$url"

# CHECK IF THE DOWNLOAD WAS SUCCESSFUL OR NOT 
if [ $? -eq 0 ]; then
  echo "File downloaded successfully to '$destination'"
else
  echo "Error: Failed to download file from '$url'"
fi
