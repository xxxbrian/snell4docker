FROM debian:stable-slim

# Initial setup
RUN apt-get update && \
    apt-get install -y wget unzip && \
    mkdir /snell
WORKDIR /snell
ADD VERSION /snell/VERSION

# Set variables
RUN VERSION=$(cat /snell/VERSION)
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
    echo $ARCH > /snell/ARCH

# Download snell
RUN wget -O snell-server.zip https://dl.nssurge.com/snell/snell-server-$(cat /snell/VERSION)-linux-$(cat /snell/ARCH).zip && \
    unzip ./snell-server.zip -d .

# Config snell
RUN yes | ./snell-server

# Clean up
RUN apt-get remove -y wget unzip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Start
CMD ["/snell/snell-server", "-c", "/snell/snell-server.conf"]