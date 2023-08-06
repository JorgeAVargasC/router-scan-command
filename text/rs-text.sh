#!/bin/bash

port=5173
ip=$(hostname -I | awk '{print $1}')

if [ -z "$ip" ]; then
  echo "Error getting IP."
  exit 1
fi

url="http://$ip:$port"

output="/home/kali/url.txt"

cat << EOF > "$output"
Por favor, copie y pegue la siguiente URL en su navegador web
de preferencia (Firefox, Google Chrome, Safari), si lo desea puede utilizar
su dispositivo móvil para acceder a la URL:
$url
EOF

mousepad "$output"
