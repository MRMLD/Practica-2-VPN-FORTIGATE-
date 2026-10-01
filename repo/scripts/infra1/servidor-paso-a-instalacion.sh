#!/bin/bash
# Infra 1 - SERVIDOR, Paso A: instalar paquetes usando solo la interfaz de management (ens4)
# Antes: configurar /etc/netplan con ens4 dhcp4: true y ejecutar "sudo netplan apply"
set -e
sudo apt update
sudo apt install -y openssh-server apache2
sudo a2enmod ssl
sudo a2ensite default-ssl
echo "<h1>Servidor Web 0682 - HTTPS por VPN</h1>" | sudo tee /var/www/html/index.html
sudo systemctl enable --now apache2 ssh
sudo systemctl restart apache2
