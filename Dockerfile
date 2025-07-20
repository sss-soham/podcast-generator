FROM ubuntu:latest

# Set noninteractive frontend to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3-pip \
    git

# Ensure pip works properly despite Debian PEP 668 protection
RUN python3.10 -m ensurepip && \
    python3.10 -m pip install --upgrade pip && \
    python3.10 -m pip install PyYAML

# Copy your script files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint executable
RUN chmod +x /entrypoint.sh

# Entrypoint
ENTRYPOINT ["/entrypoint.sh"]