FROM ubuntu:latest

# Avoid interactive prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install Python and pip dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    curl \
    git

# Manually install pip for Python 3.10
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

# Install PyYAML
RUN python3.10 -m pip install --no-cache-dir PyYAML

# Copy your files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure entrypoint is executable
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
