#!/bin/bash

# Clean system
sudo podman ps -aq | xargs sudo podman rm -f
sudo podman network remove testnet0 testnet1

sudo podman network create testnet0
sudo podman network create testnet1
# Daemon container we connect to
# Having both network and publish set is important
sudo podman run -d \
  --restart always --name nginx \
  --network testnet0 -p 80:80 \
  docker.io/library/nginx:latest

# Client container that connects
# Having two networks is important
# Test will work from testnet1, but not from testnet0
sudo podman run -d \
  --restart always --name netshoot \
  --network testnet0 --network testnet1 \
  docker.io/nicolaka/netshoot:latest \
  sleep infinity
