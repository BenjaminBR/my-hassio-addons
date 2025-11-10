FROM ghcr.io/thephaseless/byparr:latest

# Set S6 overlay configuration
ENV S6_CMD_WAIT_FOR_SERVICES=1 \
    S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0 \
    S6_SERVICES_GRACETIME=0

# Switch to root for installation
USER root

# Install bashio for Home Assistant integration
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash \
    curl \
    jq \
    ca-certificates && \
    curl -J -L -o /tmp/bashio.tar.gz \
    "https://github.com/hassio-addons/bashio/archive/v0.16.2.tar.gz" && \
    mkdir /tmp/bashio && \
    tar zxvf /tmp/bashio.tar.gz --strip 1 -C /tmp/bashio && \
    mv /tmp/bashio/lib /usr/lib/bashio && \
    ln -s /usr/lib/bashio/bashio /usr/bin/bashio && \
    rm -rf /tmp/bashio /tmp/bashio.tar.gz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy rootfs
COPY rootfs/ /

# Make scripts executable
RUN chmod a+x /etc/services.d/byparr/run

# Health check configuration
HEALTHCHECK --interval=30s --retries=5 --start-period=60s --timeout=10s \
    CMD curl -f http://127.0.0.1:8191/health || exit 1

# Labels
LABEL \
    io.hass.name="Byparr" \
    io.hass.description="Proxy server to bypass Cloudflare using Camoufox browser" \
    io.hass.arch="amd64" \
    io.hass.type="addon" \
    io.hass.version="0.1.0" \
    maintainer="BrunquersB (https://github.com/BenjaminBR)"

# Use the original entrypoint but with S6 overlay
CMD ["/etc/services.d/byparr/run"]
