#!/bin/bash

port=5173
ip=$(hostname -I | awk '{print $1}')

if [ -z "$ip" ]; then
  echo "Error getting IP."
  exit 1
fi

url="http://$ip:$port"

output="/home/kali/url.txt"

echo "$url" > "$output"

mousepad "$output"
