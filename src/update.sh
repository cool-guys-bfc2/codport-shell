#!/bin/bash
install() {
  echo "Adding startup variables"
  local filename="$1"
  local url="https://cool-guys-bfc2.github.io/codport-shell/src/${filename}"
  echo "Fetching script"
  curl -sL -o "${filename}" "$url"
  echo "Giving script execute permissions"
  chmod +x "${filename}"
  echo "Executing script"
  bash ${filename}
  echo "Job complete"
}
install run.sh
