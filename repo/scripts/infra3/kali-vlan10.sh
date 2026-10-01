#!/bin/bash
# Infra 3 - Kali: crea la VLAN 10 en el propio host y pide DHCP
sudo modprobe 8021q
sudo ip link set eth0 up
sudo ip link add link eth0 name eth0.10 type vlan id 10
sudo ip link set eth0.10 up
sudo dhclient -v eth0.10
ip -4 a show eth0.10
ip route
