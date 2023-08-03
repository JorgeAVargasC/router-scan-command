#!/bin/bash

# apt update
# apt upgrade
apt install nmap
apt install nmap-scripts
apt install nodejs
apt install npm
apt install raspi-config

cd /usr/share/nmap/scripts

rm -r nmap-vulners
git clone https://github.com/vulnersCom/nmap-vulners.git

cd /home/kali

rm -r router-scan-backend
rm -r router-scan-frontend

git clone https://github.com/JorgeAVargasC/router-scan-backend
git clone https://github.com/JorgeAVargasC/router-scan-frontend

cd /home/kali/router-scan-backend
pip install -r requirements.txt

cd /home/kali/router-scan-frontend
npm install

chmod +x /home/kali/router-scan-command/browser.service.sh
chmod +x /home/kali/router-scan-command/backend.service.sh
chmod +x /home/kali/router-scan-command/frontend.service.sh

sudo cp /home/kali/router-scan-command/browser.service /etc/systemd/system/
sudo cp /home/kali/router-scan-command/backend.service /etc/systemd/system/
sudo cp /home/kali/router-scan-command/frontend.service /etc/systemd/system/

chmod 0644 /etc/systemd/system/browser.service
chmod 0644 /etc/systemd/system/backend.service
chmod 0644 /etc/systemd/system/frontend.service

systemctl daemon-reload

systemctl enable browser.service
systemctl enable backend.service
systemctl enable frontend.service




# tmux kill-session -t "session"
# tmux new-session -d -s "session"
# tmux send-keys -t "session" "cd router-scan-backend && gunicorn app:app --bind 0.0.0.0:3000 --timeout 1000" Enter
# tmux split-window -h -t "session"
# tmux send-keys -t "session" "cd router-scan-frontend && npm run dev" Enter
# tmux attach -t "session"