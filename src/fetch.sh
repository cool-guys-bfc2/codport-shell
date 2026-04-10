mkdir -p '~/pkg'
name=$1
url=$2
echo "Installing package at ${url} as ${name}!"
response=$(curl -s "${url}")
echo "$response" > "~/pkg/${name}.txt"
