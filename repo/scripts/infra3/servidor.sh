#!/bin/bash
# Infra 3 - Servidor Ubuntu: SSH + nginx HTTPS (443). Red: configs/infra3/servidor-netplan.yaml
set -e
sudo apt update
sudo apt install -y nginx openssh-server openssl
sudo systemctl enable --now ssh
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/web0682.key -out /etc/ssl/certs/web0682.crt \
  -subj "/C=DO/O=Lab0682/CN=web0682.lab"
echo "<h1>Servidor Web 0682 - HTTPS OK</h1>" | sudo tee /var/www/html/index.html
sudo rm -f /etc/nginx/sites-enabled/default
sudo cp "$(dirname "$0")/../../configs/infra3/servidor-nginx-web0682.conf" /etc/nginx/sites-available/web0682
sudo ln -sf /etc/nginx/sites-available/web0682 /etc/nginx/sites-enabled/web0682
sudo nginx -t && sudo systemctl restart nginx
sudo ss -tlnp | grep -E ':22|:443'
