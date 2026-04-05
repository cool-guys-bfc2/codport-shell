setup() {
  mkdir ~/bin/codeport
}
install() {
  cdir=$(pwd)
  cd ~/bin/codeport
  touch $1
  curl -o $1 https://raw.githubusercontent.com/cool-guys-bfc2/codport-shell/refs/heads/main/src/$1.sh
  chmod +x $1
  cd ${cdir}
}
