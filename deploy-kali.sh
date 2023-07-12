#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt install -y nmap
sudo apt install -y nmap-scripts
sudo apt install -y python3-dev
sudo apt install -y python3-pip
sudo apt install -y nodejs
sudo apt install -y npm
sudo apt install -y tmux

cd /usr/share/nmap/scripts

sudo rm -r nmap-vulners
sudo git clone https://github.com/vulnersCom/nmap-vulners.git

cd

sudo rm -r router-scan-backend
sudo rm -r router-scan-frontend

sudo git clone https://github.com/JorgeAVargasC/router-scan-backend
sudo git clone https://github.com/JorgeAVargasC/router-scan-frontend

cd router-scan-backend
sudo pip install -r requirements.txt

cd

cd router-scan-frontend
npm install

cd

tmux kill-session -t "session"
tmux new-session -d -s "session"
tmux send-keys -t "session" "cd router-scan-backend && gunicorn app:app --bind 0.0.0.0:3000 --timeout 1000" Enter
tmux split-window -h -t "session"
tmux send-keys -t "session" "cd router-scan-frontend && npm run dev" Enter
tmux attach -t "session"