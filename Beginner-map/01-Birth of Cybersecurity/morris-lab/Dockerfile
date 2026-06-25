FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bash \
    procps \
    net-tools \
    python3 \
    openssh-server \
    sudo \
    nano \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Create learner
RUN useradd -m -s /bin/bash victim && \
    echo "victim:victim123" | chpasswd && \
    usermod -aG sudo victim

# SSH
RUN mkdir -p /var/run/sshd

# Hidden infrastructure
RUN mkdir -p /opt/kytinx

COPY . /opt/kytinx

RUN chown -R root:root /opt/kytinx && \
    chmod -R 700 /opt/kytinx && \
    chmod +x /opt/kytinx/*.sh

# Learner's home
WORKDIR /home/victim

RUN chown -R victim:victim /home/victim

RUN touch /tmp/morris.log /tmp/morris_activity.log

EXPOSE 22

ENTRYPOINT ["/opt/kytinx/entrypoint.sh"]