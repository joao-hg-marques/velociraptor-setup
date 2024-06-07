#!/bin/bash

# Update the package list
sudo apt update

# Set the timezone to Europe/London
sudo timedatectl set-timezone Europe/London

# Install snapd
sudo apt install -y snapd

# Install and refresh core snap
sudo snap install core
sudo snap refresh core

# Install wget and expect
sudo apt install -y wget expect

# Download Velociraptor
wget https://github.com/Velocidex/velociraptor/releases/download/v0.72/velociraptor-v0.72.0-linux-amd64 -O /home/ubuntu/velociraptor

# Make Velociraptor executable
chmod +x /home/ubuntu/velociraptor

# Run the script expect script for Velociraptor configuration
./velociraptor config generate -i

# Run Velociraptor with the generated server config
./velociraptor --config /home/ubuntu/server.config.yaml debian server

# Install any .deb packages
sudo dpkg -i /home/ubuntu/*.deb

