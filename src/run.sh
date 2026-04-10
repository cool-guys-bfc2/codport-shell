mkdir -p "$HOME/bin/cpd"
echo "" > "$HOME/cpf.sh"
term() {
  local name="$1"
  local fn="$2"
  local a="$3"
  local code="${name}() {
  if [ ${a} -eq 0 ]; then
    source ${fn}
  fi
  if [ ${a} -eq 1 ]; then
    source ${fn} \$1
  fi
  if [ ${a} -eq 2 ]; then
    source ${fn} \$1 \$2
  fi
  }"
  echo "${code}" >> "$HOME/cpf.sh"
}
cmd() {
  local name="$1"
  local args="$2"
  local filename="cp-${name}"
  local target_dir="$HOME/bin"
  local url="https://cool-guys-bfc2.github.io/codport-shell/src/${name}.sh"
  # -s (silent) and -L (follow redirects) are good for scripts
  curl -sL -o "${target_dir}/${filename}" "$url"
  term "${filename}" "${target_dir}/${filename}" ${args}
  chmod +x "${target_dir}/${filename}"
  echo "Installed command ${filename}"
}
cmd pkg 1
cmd install 1
cmd fetch 1
if [ -f "$HOME/bin/cpconfig.txt" ]; then
    echo "state=update" > "$HOME/bin/cpconfig.txt"
fi
if [ ! -f "$HOME/bin/cpconfig.txt" ]; then
    echo 'source "\$HOME/cpf.sh"' >> "$HOME/.bashrc"
    echo 'source "\$HOME/cpf.sh"' >> "$HOME/.zshrc"
    echo "state=new" > "$HOME/bin/cpconfig.txt"
fi
config=$(cat "$HOME/bin/cpconfig.txt")
echo "Config data: "
echo "${config}"
