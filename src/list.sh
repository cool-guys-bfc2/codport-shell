#!/bin/bash
d=$(pwd)
cd "$HOME/pkg"
echo "Packages Installed: "
for f in *; do
    echo "${f%.*}"
done
cd d
