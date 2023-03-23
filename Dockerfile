FROM debian:stable-slim

# Initial setup
RUN apt-get update && \
    apt-get install -y wget unzip && \
    mkdir /etc/snell-server \
    mkdir snell
WORKDIR /snell
ADD VERSION /etc/snell-server/VERSION
ADD start.sh /etc/snell-server/start.sh
RUN chmod +x /etc/snell-server/start.sh

# Set variables
RUN if dpkg --print-architecture | grep -q "amd64"; then \
        ARCH="amd64"; \
    elif dpkg --print-architecture | grep -q "i386"; then \
        ARCH="i386"; \
    elif uname -m | grep -q "aarch64"; then \
        ARCH="aarch64"; \
    elif uname -m | grep -q "armv7l"; then \
        ARCH="armv7l"; \
    else \
        echo "Unsupported architecture"; \
        exit 1; \
    fi && \
    echo $ARCH > /etc/snell-server/ARCH

# Download snell
RUN wget -O /etc/snell-server/snell-server.zip https://dl.nssurge.com/snell/snell-server-$(cat /etc/snell-server/VERSION)-linux-$(cat /etc/snell-server/ARCH).zip && \
    unzip /etc/snell-server/snell-server.zip -d /etc/snell-server

# Clean up
RUN apt-get remove -y wget unzip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Start
ENTRYPOINT ["/etc/snell-server/start.sh"]