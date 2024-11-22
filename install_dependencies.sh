#!/bin/bash
set -e

# Update the package list and install Docker if not already installed
if ! command -v docker &> /dev/null; then
  echo "Installing Docker..."
  sudo apt-get update -y
  sudo apt-get install -y docker.io
  sudo systemctl start docker
  sudo systemctl enable docker
  sudo usermod -aG docker ubuntu
fi

echo "Dependencies installed successfully."
