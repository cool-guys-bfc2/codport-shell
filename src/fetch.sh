#!/bin/bash

# 1. Ensure the local directory exists
mkdir -p "$HOME/pkg"

name=$1
# 2. Detect the operating system
os_type=$(uname -s | tr '[:upper:]' '[:lower:]')
if [[ "$os_type" == *"mingw"* || "$os_type" == *"msys"* || "$os_type" == *"cygwin"* ]]; then
  os_type="windows"
fi
# 3. Construct the system-dependent URL
# This assumes you have files like 'package_linux.txt' or 'package_darwin.txt'
url="https://cool-guys-bfc2.github.io/codport-shell/pkgs/${name}/${name}_${os_type}.txt"

echo "Detected OS: ${os_type}"
echo "Installing package at ${url} as ${name}!"

# 4. Fetch the file and save it locally
response=$(curl -s --fail "${url}")
curl -o config.txt -s --fail "https://cool-guys-bfc2.github.io/codport-shell/pkgs/config.txt
FILE="config.txt"
TARGET_KEY=$name
VALUE="no"  # Initialize with default

while IFS='=' read -r key val; do
    # Strip potential whitespace from key
    key=$(echo "$key" | xargs)
    if [[ "$key" == "$TARGET_KEY" ]]; then
        VALUE="$val"
        break
    fi
done < "$FILE"
if [[ "$VALUE" != "no" ]]; then
    n="$VALUE"
    cp-fetch "$n"
    cp-pkg "$n"
fi


if [ $? -eq 0 ]; then
  echo "$response" > "$HOME/pkg/${name}.txt"
  echo "Successfully saved to ~/pkg/${name}.txt"
else
  echo "Error: Could not find a package file for your system at ${url}"
  exit 1
fi
