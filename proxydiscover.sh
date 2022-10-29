#!/bin/bash

# Discover Hosts and open ports
# Pivoting, proxychain

# Variables
ports="21 22 25 80 88 443 445 8080 8081"
network="10.241.251"


for port in $ports; do
	for host in $(seq 1 254); do
		proxychains4 -q timeout 1 bash -c "echo '' > /dev/tcp/$network.$host/$port" 2>/dev/null && echo "[+] Port $port - OPEN on host $network.$host" &
	done; wait
done
