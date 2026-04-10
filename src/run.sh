mkdir -p "$HOME/bin/codeport"
cmd() {
  local filename="$1"
  local target_dir="$HOME/bin/codeport"
  local url="https://cool-guys-bfc2.github.io/codport-shell/src/${filename}.sh"
  # -s (silent) and -L (follow redirects) are good for scripts
  curl -sL -o "${target_dir}/${filename}.sh" "$url"
  
  chmod +x "${target_dir}/${filename}"
  echo "Installed ${filename} to ${target_dir}"
}
baseexec() {
  local filename="$1"
  local target_dir="$HOME/bin"
  local url="https://cool-guys-bfc2.github.io/codport-shell/src/${filename}.sh"
  rm -f "${target_dir}/${filename}.sh"
  # -s (silent) and -L (follow redirects) are good for scripts
  curl -sL -o "${target_dir}/${filename}" "$url"
  
  chmod +x "${target_dir}/${filename}"
  echo "Installed ${filename} to ${target_dir}"
}
baseexec cp
cmd pkg
cmd install
cmd fetch
if [ ! -f "$HOME/bin/cpconfig.txt" ]; then
    echo 'export PATH="$HOME/bin/codeport:$PATH"' >> ~/.bashrc
    echo "state=new" > "$HOME/bin/cpconfig.txt"
    source ~/.bashrc
fi
if [ -f "$HOME/bin/cpconfig.txt" ]; then
    echo "state=update" > "$HOME/bin/cpconfig.txt"
fi
config=$(cat "$HOME/bin/cpconfig.txt")
echo "${config}"
