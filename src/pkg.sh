#!/bin/bash
url=$1
args="${@:2}"
# Fetch the file and process it line by line
n=0
a='run'
pkg='blank'
docmd() {
  a=$1
  f=$2
  if [ "$a"=="runuri" ]; then
    curl -s $f | bash
  fi
  if [ "$a"=="pkg" ]; then
    pkg=$f
    mkdir -p "~/pkg/${f}"
    cd "~/pkg/${f}"
  fi
  if [ "$a"=="download" ]; then
    curl -O -s $f
  fi
  if [ "$a"=="exec" ]; then
    chmod +x $f
    source $f
  fi
  if [ "$a"=="execlog" ]; then
    chmod +x $f
    source $f > "output.log"
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
