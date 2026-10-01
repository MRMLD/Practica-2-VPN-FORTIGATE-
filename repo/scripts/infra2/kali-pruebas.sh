#!/bin/bash
# Infra 2 - Kali: DHCP + pruebas
sudo dhclient -v eth0
ip a show eth0; ip route
ping -c 5 10.6.82.130
traceroute 10.6.82.130
curl -k https://10.6.82.130
