#!/bin/bash

# Define the default repository URL
DEFAULT_REPO=https://github.com/Gowtham380/GT-MOVIESS

# Check if UPSTREAM_REPO is set; if not, use the default
REPO=${UPSTREAM_REPO:-$DEFAULT_REPO}

echo "Cloning Repository from $REPO"
git clone $REPO /bot

cd /bot

# Install dependencies if requirements.txt exists
if [ -f "requirements.txt" ]; then
    pip3 install -U -r requirements.txt
fi

echo "Starting Bot..."
python3 bot.py