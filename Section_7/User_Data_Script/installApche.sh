#!/bin/bash

apt-get update -y
apt-get install apache2 -y
systemctl enable --now apache2
echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html