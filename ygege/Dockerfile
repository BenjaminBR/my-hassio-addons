FROM ghcr.io/hassio-addons/base:16.3.2

# Copy ygege binary and required files from the official image
COPY --from=uwucode/ygege:latest /app/ygege /app/ygege
COPY --from=uwucode/ygege:latest /app/sessions /app/sessions

# Install runtime dependencies
RUN apk add --no-cache \
    ca-certificates \
    wget

# Copy rootfs
COPY rootfs /

# Labels
LABEL \
    io.hass.name="Ygégé" \
    io.hass.description="High-performance YGG Torrent indexer with automatic Cloudflare bypass" \
    io.hass.arch="amd64" \
    io.hass.type="addon" \
    io.hass.version="1.0.1" \
    maintainer="BrunquersB (https://github.com/BenjaminBR)"

# Expose the web interface port
EXPOSE 8715

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:8715/ || exit 1
