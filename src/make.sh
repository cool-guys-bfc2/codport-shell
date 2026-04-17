#!/bin/bash
# Define variables
FILE="$1.tar.gz"
DEST="codapp"

# 1. Create the new folder (if it doesn't already exist)
mkdir -p "$DEST"

# 2. Extract the file into the new folder
# -x: Extract, -v: Verbose output, -z: Unzip (for .gz), -f: File name, -C: Change to directory
tar -xvzf "$FILE" -C "$DEST"
rm -rf "$DEST"
