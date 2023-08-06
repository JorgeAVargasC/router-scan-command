#!/bin/bash

print_success() {
  echo "\e[32m$1\e[0m"  # 32 es el código de color para verde, 0 restablece el color a la configuración predeterminada
}

# apt update
apt install nmap
# apt install nmap-scripts
apt install openssh-server
apt install nodejs
apt install npm
apt install kalipi-config

print_success "[SUCCESS] Installed nmap, nodejs, npm and kalipi-config"

# Remove and install new scripts
cd /usr/share/nmap/scripts
rm -r nmap-vulners
git clone https://github.com/vulnersCom/nmap-vulners.git

print_success "[SUCCESS] Installed nmap-vulners"

# Remove and install new backend and frontend
cd /home/kali
rm -r router-scan-backend
rm -r router-scan-frontend
git clone https://github.com/JorgeAVargasC/router-scan-backend
git clone https://github.com/JorgeAVargasC/router-scan-frontend

print_success "[SUCCESS] Installed router-scan-backend and router-scan-frontend"

# Install new requirements

cd /home/kali
cd router-scan-backend
pip install -r requirements.txt

cd /home/kali/
cd router-scan-frontend
npm install

print_success "[SUCCESS] Installed requirements"

# Give permissions to scripts

chmod +x /home/kali/router-scan-command/browser/rs-browser.sh
chmod +x /home/kali/router-scan-command/text/rs-text.sh
chmod +x /home/kali/router-scan-command/backend/rs-backend.sh
chmod +x /home/kali/router-scan-command/frontend/rs-frontend.sh

# Remove old services

systemctl stop rs-browser.service
systemctl stop rs-text.service
systemctl stop rs-backend.service
systemctl stop rs-frontend.service

systemctl disable rs-browser.service
systemctl disable rs-text.service
systemctl disable rs-backend.service
systemctl disable rs-frontend.service

rm /etc/systemd/system/rs-browser.service
rm /etc/systemd/system/rs-text.service
rm /etc/systemd/system/rs-backend.service
rm /etc/systemd/system/rs-frontend.service

# Create new services

sudo cp /home/kali/router-scan-command/browser/rs-browser.service /etc/systemd/system/
sudo cp /home/kali/router-scan-command/text/rs-text.service /etc/systemd/system/
sudo cp /home/kali/router-scan-command/backend/rs-backend.service /etc/systemd/system/
sudo cp /home/kali/router-scan-command/frontend/rs-frontend.service /etc/systemd/system/

chmod 0644 /etc/systemd/system/rs-browser.service
chmod 0644 /etc/systemd/system/rs-text.service
chmod 0644 /etc/systemd/system/rs-backend.service
chmod 0644 /etc/systemd/system/rs-frontend.service

systemctl daemon-reload

systemctl enable rs-browser.service
systemctl enable rs-text.service
systemctl enable rs-backend.service
systemctl enable rs-frontend.service

print_success "[SUCCESS] enabled services"

print_success "$(hostname -I | awk '{print $1}')"


# tmux kill-session -t "session"
# tmux new-session -d -s "session"
# tmux send-keys -t "session" "cd router-scan-backend && gunicorn app:app --bind 0.0.0.0:3000 --timeout 1000" Enter
# tmux split-window -h -t "session"
# tmux send-keys -t "session" "cd router-scan-frontend && npm run dev" Enter
# tmux attach -t "session"