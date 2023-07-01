#!/bin/bash

apk update
apk upgrade
apk add --no-cache gcc
apk add --co-cache libxml2-dev
apk add --no-cache libxslt-dev
apk add --no-cache musl-dev
apk add --no-cache build-base
apk add --no-cache linux-headers
apk add --no-cache git
apk add --no-cache nmap
apk add --no-cache nmap-scripts
apk add --no-cache python3-dev
apk add --no-cache py3-pip
apk add --no-cache nodejs npm
apk add --no-cache tmux

mkdir -p /usr/share/nmap/scripts
cd /usr/share/nmap/scripts
git clone https://github.com/vulnersCom/nmap-vulners.git

cd /

rm -r router-scan-backend
rm -r router-scan-frontend

git clone https://github.com/JorgeAVargasC/router-scan-backend
git clone https://github.com/JorgeAVargasC/router-scan-frontend

cd /router-scan-backend
pip install -r requirements.txt

cd /router-scan-frontend
npm install

cd /

tmux new-session -d -s "session"
tmux send-keys -t "session" "cd router-scan-backend && python3 app.py" Enter
tmux split-window -h -t "session" "cd router-scan-frontend && npm run dev"
tmux attach -t "session"