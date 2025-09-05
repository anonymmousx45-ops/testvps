#!/bin/bash
# Update & upgrade Ubuntu
apt-get update && apt-get upgrade -y

# Install extra tools
apt-get install -y sudo curl wget vim git htop tmux net-tools iproute2 python3-pip

# Clean up
apt-get clean && rm -rf /var/lib/apt/lists/*

echo "Mini Ubuntu VPS ready!"
