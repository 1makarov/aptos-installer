#!/bin/bash
if [[ $EUID -ne 0 ]]; then
           echo "This script must be run as root."
              exit 1
fi

# Start.
echo "Aptos Fullnode Installer - GitHub @1makarov"

# Update and Install
apt update
apt install curl docker.io ca-certificates gnupg lsb-release wget -y

# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose

# Downloads configs...
mkdir /home/aptos

wget -O /home/aptos/docker-compose.yaml https://raw.githubusercontent.com/aptos-labs/aptos-core/main/docker/compose/public_full_node/docker-compose.yaml
wget -O /home/aptos/public_full_node.yaml https://raw.githubusercontent.com/aptos-labs/aptos-core/main/docker/compose/public_full_node/public_full_node.yaml
wget -O /home/aptos/genesis.blob https://devnet.aptoslabs.com/genesis.blob
wget -O /home/aptos/waypoint.txt https://devnet.aptoslabs.com/waypoint.txt

# Running docker-compose
docker-compose -f /home/aptos/docker-compose.yaml up -d