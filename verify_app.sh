#!/bin/bash
set -e

echo "Verifying application is running..."

# Check if the application responds successfully on port 80
if curl -s http://localhost | grep -q "Expected Content"; then
  echo "Application is running successfully."
  exit 0
else
  echo "Application failed to start."
  exit 1
fi
