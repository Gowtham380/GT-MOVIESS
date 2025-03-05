FROM python:3.10-slim-buster

# Update and install git
RUN apt update && apt upgrade -y && apt install git -y

# Set the working directory
WORKDIR /bot

# Copy the start script into the container
COPY start.sh /bot/start.sh

# Ensure the start script has execute permissions
RUN chmod +x /bot/start.sh

# Install pip dependencies (if any)
# COPY requirements.txt /bot/requirements.txt
# RUN pip3 install -U pip && pip3 install -U -r /bot/requirements.txt

# Run the start script
CMD ["/bin/bash", "/bot/start.sh"]