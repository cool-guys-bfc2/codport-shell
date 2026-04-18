#!/bin/bash
# Define variables
FILE="$1.tar.xz"
DEST="codapp"
mkdir -p "$HOME/bin/cod-$1/"
mkdir -p "$HOME/bin/cod-$1/exec"
# 1. Create the new folder (if it doesn't already exist)
mkdir -p "$DEST"

# 2. Extract the file into the new folder
# -x: Extract, -v: Verbose output, -z: Unzip (for .gz), -f: File name, -C: Change to directory
tar -xvzf "$FILE" -C "$DEST"
for file in *; do
    if [[ -f "$file" ]]; then
        if [[ "$file" == *.txt ]]; then
            cp "$file" "$HOME/pkg
        else
            cp "$file" "$HOME/bin/cod-$1/exec"
        fi
    fi
done

rm -rf "$DEST"
