#!/bin/bash
# Lightweight VPS post-create setup

# Update & upgrade system
apt-get update && apt-get upgrade -y

# Ensure essential tools are installed
apt-get install -y sudo curl wget vim git python3 python3-pip tmux htop net-tools iproute2

# Clean up to save space
apt-get clean && rm -rf /var/lib/apt/lists/*

echo "Lightweight mini VPS ready!"
