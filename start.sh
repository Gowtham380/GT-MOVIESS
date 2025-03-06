#!/bin/bash

# Define the default repository URL
DEFAULT_REPO="https://github.com/Gowtham380/GT-MOVIESS"

# Check if UPSTREAM_REPO is set; if not, use the default
REPO=${UPSTREAM_REPO:-$DEFAULT_REPO}

# Ensure the base directory exists before cloning
mkdir -p /bot

# Remove any existing /bot directory
rm -rf /bot/*

# Clone the repository
echo "Cloning Repository from $REPO"
git clone $REPO /bot || { echo "Git clone failed!"; exit 1; }

# Change directory to /bot
cd /bot || { echo "Failed to enter /bot directory"; exit 1; }

# Install dependencies if requirements.txt exists
if [ -f "requirements.txt" ]; then
    pip3 install -U -r requirements.txt
fi

# Check if bot.py exists before running
if [ -f "bot.py" ]; then
    echo "Starting Bot..."
    python3 bot.py
else
    echo "Error: bot.py not found!"
    exit 1
fi