FROM debian:buster-slim

# Install dependencies and add Brave repository
RUN apt update && \
    apt install -y curl apt-transport-https gnupg && \
    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - && \
    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" > /etc/apt/sources.list.d/brave-browser-release.list && \
    apt update && \
    apt install -y brave-browser && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add a non-root user
RUN useradd -m brave

# Set user
USER brave

# Start Brave
ENTRYPOINT [ "brave-browser", "--no-sandbox", "--user-data-dir=/data" ]

