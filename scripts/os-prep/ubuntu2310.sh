#!/bin/bash

sudo apt-get update && sudo apt-get install -y podman
# Mitigate https://bugs.launchpad.net/ubuntu/+source/libpod/+bug/2040483/comments/5
mkdir -p /etc/containers/containers.conf.d
echo -e "[CONTAINERS]\napparmor_profile=\"\"\n" > /etc/containers/containers.conf.d/10-disable-apparmor.conf
