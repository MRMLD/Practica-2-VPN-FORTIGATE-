#!/bin/bash
# Infra 2 - Servidor Ubuntu: red (ver configs/infra2/servidor-netplan.yaml) + nginx HTTPS
set -e
sudo apt update
sudo apt install -y nginx openssh-server openssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/web.key -out /etc/ssl/certs/web.crt -subj "/CN=10.6.82.130"
sudo tee /etc/nginx/sites-available/default >/dev/null <<'CONF'
server {
    listen 443 ssl default_server;
    ssl_certificate /etc/ssl/certs/web.crt;
    ssl_certificate_key /etc/ssl/private/web.key;
    root /var/www/html;
    index index.html;
}
CONF
echo "<h1>Servidor Web 0682 - HTTPS OK</h1>" | sudo tee /var/www/html/index.html
sudo systemctl restart nginx
sudo systemctl enable ssh nginx
ip a show ens4
