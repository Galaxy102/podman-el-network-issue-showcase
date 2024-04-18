#!/bin/bash

HOSTIP="$(hostname -I | grep -E "192.168.56.1[[:digit:]]{2}" -o)"
echo "Probing $HOSTIP"

sudo podman exec netshoot curl --max-time 10 --interface eth0 -Ss -o /dev/null http://$HOSTIP && echo "eth0 OK" || echo "eth0 Error"
sudo podman exec netshoot curl --max-time 10 --interface eth1 -Ss -o /dev/null http://$HOSTIP && echo "eth1 OK" || echo "eth1 Error"


echo "Probing http://google.com"
sudo podman exec netshoot curl --max-time 10 --interface eth0 -Ss -o /dev/null http://www.google.com && echo "eth0 OK" || echo "eth0 Error"
sudo podman exec netshoot curl --max-time 10 --interface eth1 -Ss -o /dev/null http://www.google.com && echo "eth1 OK" || echo "eth1 Error"
