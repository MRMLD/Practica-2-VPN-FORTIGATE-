#!/bin/bash
# Infra 1 - PC-USUARIO (Ubuntu Desktop): DHCP y pruebas
sudo dhclient -v
ip a
ip route
ping -c 4 10.6.82.130
traceroute 10.6.82.130
curl -k https://10.6.82.130
