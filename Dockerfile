# Ultra-lightweight Ubuntu VPS
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install only essential tools
RUN apt-get update && \
    apt-get install -y sudo curl wget vim git python3 python3-pip tmux htop net-tools iproute2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -ms /bin/bash ubuntu && \
    echo "ubuntu:ubuntu" | chpasswd && adduser ubuntu sudo

# Set working directory
WORKDIR /home/ubuntu

# Keep container alive
CMD ["bash", "-c", "while true; do sleep 1000; done"]
