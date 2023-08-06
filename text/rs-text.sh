#!/bin/bash

port=5173
ip=$(ip -o -4 addr show | grep 'scope global' | awk '{print $4}' | cut -d'/' -f1)

if [ -z "$ip" ]; then
  echo "Error getting IP."
  exit 1
fi

url="http://$ip:$puerto"

output="url.txt"

echo "$url" > "$output"

mousepad "$output"
