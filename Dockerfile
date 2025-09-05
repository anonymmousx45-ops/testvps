# Ultra-lightweight Ubuntu base
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install only essential tools
RUN apt-get update && \
    apt-get install -y sudo curl wget vim git python3 python3-pip tmux htop net-tools iproute2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Optional: create a non-root user
RUN useradd -ms /bin/bash ubuntu && \
    echo "ubuntu:ubuntu" | chpasswd && adduser ubuntu sudo

# Switch to non-root user (feel free to use root if you prefer)
USER ubuntu
WORKDIR /home/ubuntu

# Start bash by default
CMD ["/bin/bash"]
