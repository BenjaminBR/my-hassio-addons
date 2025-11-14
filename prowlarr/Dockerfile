FROM linuxserver/prowlarr:2.1.5

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

COPY https://gist.githubusercontent.com/Clemv95/8bfded23ef23ec78f6678896f42a2b60/raw/f1c073f1994ab9c5c13ab68fa463ac2c862299c8/ygg-api-download.yml \
        /config/Definitions/Custom/ygg-api.yml

COPY https://raw.githubusercontent.com/Jackett/Jackett/master/src/Jackett.Common/Definitions/yggtorrent.yml \
        /config/Definitions/Custom/yggtorrent.yml

COPY https://raw.githubusercontent.com/Jackett/Jackett/master/src/Jackett.Common/Definitions/yggcookie.yml \
        /config/Definitions/Custom/yggcookie.yml

# Health check configuration
HEALTHCHECK --interval=30s --retries=5 --start-period=60s --timeout=10s \
    CMD curl -f http://127.0.0.1:9696/api/v1/health || exit 1

# Labels
LABEL \
    io.hass.name="Prowlarr" \
    io.hass.description="Prowlarr is an indexer manager/proxy built on the popular *arr .net/reactjs base stack" \
    io.hass.arch="amd64" \
    io.hass.type="addon" \
    io.hass.version="0.1.0" \
    maintainer="BrunquersB (https://github.com/BenjaminBR)"