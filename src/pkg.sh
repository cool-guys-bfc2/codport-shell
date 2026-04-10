#!/bin/bash
url=$1
args="${@:2}"
n=0

docmd() {
  local action=$1
  local target=$2
  
  case "$action" in
    "runuri")  curl -s "$target" | bash ;;
    "pkg")     pkg="$target"
               mkdir -p "$HOME/pkg/$target"
               cd "$HOME/pkg/$target" || exit ;;
    "download") curl -O -s "$target" ;;
    "exec")    chmod +x "$target"; source "./$target" ;;
    "execlog") chmod +x "$target"; source "./$target" > "output.log" ;;
    "execarg") chmod +x "$target"; source "./$target" $args ;;
    "execute") chmod +x "$target"; source "./$target" $args > "output.log" ;;
    "bash")    echo "$target" > "cache.sh"; bash "cache.sh" ;;
  esac
}

input_file="$HOME/pkg/${url}.sh" # Assuming .sh or .txt based on your logic

while IFS= read -r line || [[ -n "$line" ]]; do
    if (( n % 2 == 0 )); then
      action_cmd="$line"
    else
      docmd "$action_cmd" "$line"
    fi
    n=$((n + 1))
done < "$input_file"
