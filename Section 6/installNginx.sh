#!/bin/bash

# Sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished]]; do
    sleep 1
done

# install nginx
apt-get update -y
apt-get -y install nginx

# Start the service
systemctl enable --now nginx