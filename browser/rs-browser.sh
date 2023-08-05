#!/bin/bash

port=5173
ip=$(ip -o -4 addr show | grep 'scope global' | awk '{print $4}' | cut -d'/' -f1)

if [ -z "$ip" ]; then
  echo "Error getting IP."
  exit 1
fi

firefox "http://$ip:$puerto" || echo "Error opening Firefox."
