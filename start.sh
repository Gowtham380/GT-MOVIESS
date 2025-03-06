#!/bin/bash

# Define repository (Use UPSTREAM_REPO if set, otherwise use the default repo)
REPO=${UPSTREAM_REPO:-"https://github.com/Gowtham380/GT-MOVIESS"}

# Remove old bot files (to prevent conflicts)
rm -rf /bot
mkdir -p /bot

# Clone the repository
echo "Cloning Repository from $REPO"
git clone $REPO /bot || { echo "Git clone failed!"; exit 1; }

# Navigate into the bot directory
cd /bot || { echo "Failed to enter /bot directory"; exit 1; }

# Install dependencies if requirements.txt exists
if [ -f "requirements.txt" ]; then
    echo "Installing Dependencies..."
    pip3 install -U -r requirements.txt || { echo "Dependency installation failed!"; exit 1; }
else
    echo "Warning: requirements.txt not found!"
fi

# Check if bot.py exists before running
if [ -f "bot.py" ]; then
    echo "Starting Bot..."
    python3 bot.py
else
    echo "Error: bot.py not found!"
    exit 1
fi