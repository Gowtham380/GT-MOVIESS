FROM python:3.10-slim-buster

# Update & install git
RUN apt update && apt upgrade -y && apt install git -y

# Set the working directory
WORKDIR /bot

# Copy the start script and give execute permission
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Run the bot
CMD ["/bin/bash", "/start.sh"]