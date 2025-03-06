#!/bin/bash

# Define the default repository URL
DEFAULT_REPO="https://github.com/Gowtham380/GT-MOVIESS"

# Use UPSTREAM_REPO if set; otherwise, use the default
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
git clone --depth=1 $REPO /bot || { echo "Git clone failed!"; exit 1; }

# Change directory to /bot
cd /bot || { echo "Error: Failed to enter /bot directory"; exit 1; }

# Verify files are present
if [ ! -f "bot.py" ]; then
    echo "Error: bot.py is missing!"
    ls -l  # Show contents for debugging
    exit 1
fi

# Upgrade pip
pip3 install --upgrade pip

# Install dependencies if requirements.txt exists
if [ -f "requirements.txt" ]; then
    pip3 install -r requirements.txt || { echo "Failed to install dependencies!"; exit 1; }
else
    echo "Warning: requirements.txt not found, skipping dependency installation."
fi

# Run the bot
echo "Starting Bot..."
python3 bot.py