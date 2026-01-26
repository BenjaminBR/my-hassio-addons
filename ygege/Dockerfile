FROM uwucode/ygege:latest

# Labels
LABEL \
    io.hass.name="Ygégé" \
    io.hass.description="High-performance YGG Torrent indexer with automatic Cloudflare bypass" \
    io.hass.arch="amd64" \
    io.hass.type="addon" \
    io.hass.version="1.0.0" \
    maintainer="BrunquersB (https://github.com/BenjaminBR)"

# Set default environment variables
ENV BIND_IP="0.0.0.0" \
    BIND_PORT="8715" \
    LOG_LEVEL="info"

# Expose the web interface port
EXPOSE 8715

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:8715/ || exit 1
