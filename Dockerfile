# Use Ubuntu 22.04 as base image
FROM ubuntu:22.04

# Prevent interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Update and install some basic tools (you can add more later)
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        sudo \
        curl \
        wget \
        vim \
        git \
        net-tools \
        iproute2 \
        openssh-server \
        python3 \
        python3-pip \
        htop \
        tmux \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user (optional, safer than root)
RUN useradd -ms /bin/bash ubuntu \
    && echo "ubuntu:ubuntu" | chpasswd \
    && adduser ubuntu sudo

# Switch to the new user
USER ubuntu
WORKDIR /home/ubuntu

# Expose SSH port if you want to connect via SSH
EXPOSE 22

# Start bash by default
CMD ["/bin/bash"]
