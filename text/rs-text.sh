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
Pasos para realizar el escaneo:

[1] Conecta el escáner a tu red doméstica por medio del cable ethernet.
[2] Conecta tu dispositivo móvil o computadora a la misma red.
[3] Abre el navegador web de tu preferencia (Ejemplo: Chrome, Firefox, Safari etc).
[4] Ingresa la siguiente dirección en la barra de direcciones del navegador:

$url
EOF

mousepad "$output"
