FROM uwucode/ygege:latest

# Install bash and bashio for Home Assistant integration
RUN apk add --no-cache bash curl jq

# Install bashio
RUN curl -J -L -o /tmp/bashio.tar.gz \
    "https://github.com/hassio-addons/bashio/archive/v0.16.2.tar.gz" \
    && mkdir -p /tmp/bashio \
    && tar zxvf /tmp/bashio.tar.gz --strip 1 -C /tmp/bashio \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && rm -rf /tmp/bashio /tmp/bashio.tar.gz

# Copy startup script
COPY rootfs/run.sh /run.sh
RUN chmod a+x /run.sh

# Labels
LABEL \
    io.hass.name="Ygégé" \
    io.hass.description="High-performance YGG Torrent indexer with automatic Cloudflare bypass" \
    io.hass.arch="amd64" \
    io.hass.type="addon" \
    io.hass.version="1.0.2" \
    maintainer="BrunquersB (https://github.com/BenjaminBR)"

# Expose the web interface port
EXPOSE 8715

# Use our startup script
CMD ["/run.sh"]

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:8715/ || exit 1
