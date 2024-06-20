#!/bin/bash

MINECRAFT_PORT=$1

# Install dependencies
apt update
apt install -y openjdk-11-jre-headless wget

# Download and install Crafty
wget -O /tmp/crafty-installer.sh https://gitlab.com/crafty-controller/crafty-installer/-/raw/master/install.sh
chmod +x /tmp/crafty-installer.sh
/tmp/crafty-installer.sh

# Configure Crafty to use the generated Minecraft port
echo "server-port=$MINECRAFT_PORT" >> /opt/crafty/config/crafty.config
