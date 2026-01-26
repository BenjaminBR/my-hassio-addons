FROM uwucode/ygege:latest

# Install dependencies for Home Assistant integration
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        curl \
        jq \
        wget \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Copy startup script
COPY rootfs/run.sh /run.sh
RUN chmod a+x /run.sh

# Labels
LABEL \
    io.hass.name="Ygégé" \
    io.hass.description="High-performance YGG Torrent indexer with automatic Cloudflare bypass" \
    io.hass.arch="amd64" \
    io.hass.type="addon" \
    io.hass.version="1.0.3" \
    maintainer="BrunquersB (https://github.com/BenjaminBR)"

# Expose the web interface port
EXPOSE 8715

# Use our startup script
ENTRYPOINT ["/run.sh"]

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:8715/health || exit 1
