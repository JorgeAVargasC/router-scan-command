#!/bin/bash

# apt update
apt install nmap
apt install nmap-scripts
apt install nodejs
apt install npm
apt install kalipi-config

# Remove and install new scripts

rm -r /usr/share/nmap/scripts/nmap-vulners
git clone https://github.com/vulnersCom/nmap-vulners.git

# Remove and install new backend and frontend

rm -r /home/kali/router-scan-backend
rm -r /home/kali/router-scan-frontend

git clone https://github.com/JorgeAVargasC/router-scan-backend
git clone https://github.com/JorgeAVargasC/router-scan-frontend

# Install new requirements

cd /home/kali/router-scan-backend
pip install -r requirements.txt

cd /home/kali/router-scan-frontend
npm install

# Give permissions to scripts

chmod +x /home/kali/router-scan-command/browser/rs-browser.sh
chmod +x /home/kali/router-scan-command/backend/rs-backend.sh
chmod +x /home/kali/router-scan-command/frontend/rs-frontend.sh

# Remove old services

systemctl stop rs-browser.service
systemctl stop rs-backend.service
systemctl stop rs-frontend.service

systemctl disable rs-browser.service
systemctl disable rs-backend.service
systemctl disable rs-frontend.service

rm /etc/systemd/system/rs-browser.service
rm /etc/systemd/system/rs-backend.service
rm /etc/systemd/system/rs-frontend.service

# Create new services

sudo cp /home/kali/router-scan-command/browser/rs-browser.service /etc/systemd/system/
sudo cp /home/kali/router-scan-command/backend/rs-backend.service /etc/systemd/system/
sudo cp /home/kali/router-scan-command/frontend/rs-frontend.service /etc/systemd/system/

chmod 0644 /etc/systemd/system/rs-browser.service
chmod 0644 /etc/systemd/system/rs-backend.service
chmod 0644 /etc/systemd/system/rs-frontend.service

systemctl daemon-reload

systemctl enable rs-browser.service
systemctl enable rs-backend.service
systemctl enable rs-frontend.service




# tmux kill-session -t "session"
# tmux new-session -d -s "session"
# tmux send-keys -t "session" "cd router-scan-backend && gunicorn app:app --bind 0.0.0.0:3000 --timeout 1000" Enter
# tmux split-window -h -t "session"
# tmux send-keys -t "session" "cd router-scan-frontend && npm run dev" Enter
# tmux attach -t "session"