FROM linuxserver/prowlarr:2.1.5

# Set S6 overlay configuration
ENV S6_CMD_WAIT_FOR_SERVICES=1 \
    S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0 \
    S6_SERVICES_GRACETIME=0

# Switch to root for installation
USER root

ADD https://gist.githubusercontent.com/Clemv95/8bfded23ef23ec78f6678896f42a2b60/raw/f1c073f1994ab9c5c13ab68fa463ac2c862299c8/ygg-api-download.yml \
        /config/Definitions/Custom/ygg-api.yml

ADD https://raw.githubusercontent.com/Jackett/Jackett/master/src/Jackett.Common/Definitions/yggtorrent.yml \
        /config/Definitions/Custom/yggtorrent.yml

ADD https://raw.githubusercontent.com/Jackett/Jackett/master/src/Jackett.Common/Definitions/yggcookie.yml \
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