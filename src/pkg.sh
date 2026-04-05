#!/bin/bash
url=$1
# Fetch the file and process it line by line
n=0
a='run'
docmd() {
  a=$1
  f=$2
  if [ "$a"=="run" ]; then
    curl -s $f | bash
  fi
}
while IFS= read -r line || [[ -n "$line" ]]; do
    # Perform actions on each line
    if (( n % 2 == 0 )); then
      a="$line"
    fi
    if (( n % 2 == 1 )); then
      docmd "$a" "$line"
    fi
    var=$((var + 1))
    echo "Processing: $line"
done < <(cat "~/pkg/${url}.txt")
