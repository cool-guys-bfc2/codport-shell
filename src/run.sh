mkdir -p "$HOME/bin/cpd"
cmd() {
  local name="$1"
  local filename="cp-${name}"
  local target_dir="$HOME/bin"
  local url="https://cool-guys-bfc2.github.io/codport-shell/src/${name}.sh"
  # -s (silent) and -L (follow redirects) are good for scripts
  curl -sL -o "${target_dir}/${filename}" "$url"
  
  chmod +x "${target_dir}/${filename}"
  echo "Installed command ${filename}"
}
cmd pkg
cmd install
cmd fetch
source "$HOME/.bashrc"
if [ -f "$HOME/bin/cpconfig.txt" ]; then
    echo "state=update" > "$HOME/bin/cpconfig.txt"
fi
if [ ! -f "$HOME/bin/cpconfig.txt" ]; then
    echo "export PATH=$PATH:$HOME/bin" >> "$HOME/.bashrc"
    echo "state=new" > "$HOME/bin/cpconfig.txt"
fi
config=$(cat "$HOME/bin/cpconfig.txt")
echo "Config data: "
echo "${config}"
