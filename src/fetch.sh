mkdir -p '~/pkg'
name=$1
url="https://raw.githubusercontent.com/cool-guys-bfc2/codport-shell/refs/heads/main/pkgs/${name}.txt"
echo "Installing package at ${url} as ${name}!"
response=$(curl -s "${url}")
echo "$response" > "~/pkg/${name}.txt"
