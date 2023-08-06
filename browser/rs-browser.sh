#!/bin/bash

port=5173
ip=$(hostname -I | awk '{print $1}')

if [ -z "$ip" ]; then
  echo "Error getting IP."
  exit 1
fi

firefox "http://$ip:$puerto" || echo "Error opening Firefox."
