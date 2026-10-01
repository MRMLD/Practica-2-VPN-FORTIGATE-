#!/bin/bash
# Infra 3 - Pruebas desde Kali
echo "== A) HTTPS sin VPN (VIP en 200.6.82.6:443) =="; curl -k https://200.6.82.6
echo "== B) SSH sin VPN (debe fallar por timeout) =="; ssh -o ConnectTimeout=5 mario@200.6.82.6
echo "== Levantar VPN =="; ping -c 4 10.6.82.130
echo "== SSH por la VPN =="; ssh mario@10.6.82.130
echo "== Traceroute =="; traceroute -I 10.6.82.130
