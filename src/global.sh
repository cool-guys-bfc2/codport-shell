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
url="https://cool-guys-bfc2.github.io/codport-pkg/${os_type}/${name}.txt"

echo "Detected OS: ${os_type}"
echo "Installing package at ${url} as ${name}!"

# 4. Fetch the file and save it locally
response=$(curl -s --fail "${url}")
if [ $? -eq 0 ]; then
  echo "$response" > "$HOME/pkg/${name}.txt"
  echo "Successfully saved to ~/pkg/${name}.txt"
else
  echo "Error: Could not find a package file for your system at ${url}"
  exit 1
fi
