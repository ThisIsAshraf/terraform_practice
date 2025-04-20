#!/bin/bash

# Sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do  # <-- Space added before ]]
    sleep 1
done

# Install nginx
apt-get update -y
apt-get -y install nginx

# Start the service
systemctl enable --now nginx