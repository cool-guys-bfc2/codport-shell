mkdir -p "$HOME/bin/codeport"
cmd() {
  local filename="$1"
  local target_dir="$HOME/bin/codeport"
  local url="https://raw.githubusercontent.com/cool-guys-bfc2/codport-shell/refs/heads/main/src/${filename}.sh"

  # -s (silent) and -L (follow redirects) are good for scripts
  curl -sL -o "${target_dir}/${filename}" "$url"
  
  chmod +x "${target_dir}/${filename}"
  echo "Installed ${filename} to ${target_dir}"
}
baseexec() {
  local filename="$1"
  local target_dir="$HOME/bin"
  local url="https://raw.githubusercontent.com/cool-guys-bfc2/codport-shell/refs/heads/main/src/${filename}.sh"

  # -s (silent) and -L (follow redirects) are good for scripts
  curl -sL -o "${target_dir}/${filename}" "$url"
  
  chmod +x "${target_dir}/${filename}"
  echo "Installed ${filename} to ${target_dir}"
}
baseexec codeport
cmd pkg
cmd install
