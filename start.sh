#!/bin/bash

# Define the default repository URL
DEFAULT_REPO="https://github.com/Gowtham380/GT-MOVIESS"

# Check if UPSTREAM_REPO is set; if not, use the default
REPO=${UPSTREAM_REPO:-$DEFAULT_REPO}

# Ensure Git is installed
if ! command -v git &> /dev/null; then
    echo "Error: Git is not installed!"
    exit 1
fi

# Remove existing bot directory and create a fresh one
rm -rf /bot
mkdir -p /bot

# Clone the repository
echo "Cloning Repository from $REPO"
git clone $REPO /bot || { echo "Git clone failed!"; exit 1; }

# Change directory to /bot
cd /bot || { echo "Error: Failed to enter /bot directory"; exit 1; }

# Update pip
pip3 install --upgrade pip

# Install dependencies if requirements.txt exists
if [ -f "requirements.txt" ]; then
    pip3 install -r requirements.txt || { echo "Failed to install dependencies!"; exit 1; }
else
    echo "Warning: requirements.txt not found, skipping dependency installation."
fi

# Check if bot.py exists before running
if [ -f "bot.py" ]; then
    echo "Starting Bot..."
    python3 bot.py
else
    echo "Error: bot.py not found!"
    exit 1
fi