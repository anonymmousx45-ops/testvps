# Base Ubuntu 22.04 image
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools
RUN apt-get update && \
    apt-get install -y sudo curl wget vim git htop tmux net-tools iproute2 python3 python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a non-root user (optional)
RUN useradd -ms /bin/bash ubuntu && \
    echo "ubuntu:ubuntu" | chpasswd && adduser ubuntu sudo

# Switch to the non-root user
USER ubuntu
WORKDIR /home/ubuntu
CMD ["/bin/bash"]
