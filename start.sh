#!/bin/bash

# Define the default repository URL
DEFAULT_REPO="https://github.com/Gowtham380/GT-MOVIESS"

# Check if UPSTREAM_REPO is set; if not, use the default
REPO=${UPSTREAM_REPO:-$DEFAULT_REPO}

# Remove the existing directory if it exists
if [ -d "/bot" ]; then
    echo "Removing existing /bot directory..."
    rm -rf /bot
fi

# Clone the repository
echo "Cloning Repository from $REPO"
git clone $REPO /bot

cd /bot || exit

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