#!/bin/bash

apk update && apk add --no-cache gcc musl-dev && apk add libxml2-dev libxslt-dev

apk add --no-cache build-base linux-headers

apk add --no-cache git

apk add --no-cache nmap

apk add --no-cache nmap-scripts

apk add --no-cache python3-dev

apk add --no-cache nodejs npm

mkdir -p /usr/share/nmap/scripts \
  && cd /usr/share/nmap/scripts \
  && git clone https://github.com/vulnersCom/nmap-vulners.git

cd /

git clone https://github.com/JorgeAVargasC/router-scan-backend
git clone https://github.com/JorgeAVargasC/router-scan-frontend