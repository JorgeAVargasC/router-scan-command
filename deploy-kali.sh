#!/bin/bash

# apt update
# apt upgrade
apt install nmap
apt install nmap-scripts
# apt install -y python3-dev
# apt install -y python3-pip
apt install nodejs
apt install npm
apt install tmux

cd /usr/share/nmap/scripts

rm -r nmap-vulners
git clone https://github.com/vulnersCom/nmap-vulners.git

cd /home/kali

rm -r router-scan-backend
rm -r router-scan-frontend

git clone https://github.com/JorgeAVargasC/router-scan-backend
git clone https://github.com/JorgeAVargasC/router-scan-frontend

cd router-scan-backend
pip install -r requirements.txt

cd /home/kali

cd router-scan-frontend
npm install

cd /home/kali

tmux kill-session -t "session"
tmux new-session -d -s "session"
tmux send-keys -t "session" "cd router-scan-backend && gunicorn app:app --bind 0.0.0.0:3000 --timeout 1000" Enter
tmux split-window -h -t "session"
tmux send-keys -t "session" "cd router-scan-frontend && npm run dev" Enter
tmux attach -t "session"