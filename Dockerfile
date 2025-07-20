FROM ubuntu:latest

# Update & install Python + pip
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Link python3.10 and pip3 explicitly to python and pip
RUN ln -sf /usr/bin/python3.10 /usr/bin/python && \
    ln -sf /usr/bin/pip3 /usr/bin/pip

# Install PyYAML
RUN pip install --upgrade pip && pip install PyYAML

# Copy files into image
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make sure entrypoint.sh is executable
RUN chmod +x /entrypoint.sh

# Entry point
ENTRYPOINT ["/entrypoint.sh"]
