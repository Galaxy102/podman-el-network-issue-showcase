#!/bin/bash

# Vagrant's network settings are not applied for some reason...
sudo nmcli con mod "Wired connection 1" ipv4.address 192.168.56.167/24
sudo nmcli con up "Wired connection 1"
sudo dnf install -y podman
