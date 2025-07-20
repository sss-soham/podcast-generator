FROM ubuntu:latest

# Install Python and Git
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git && \
    ln -sf /usr/bin/python3.10 /usr/bin/python3 && \
    ln -sf /usr/bin/pip3 /usr/bin/pip

# Install Python dependencies
RUN pip install PyYAML

# Copy script files
COPY feed.py /usr/local/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint executable
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]