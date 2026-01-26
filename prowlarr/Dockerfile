FROM linuxserver/prowlarr:2.3.0

# Set S6 overlay configuration
ENV S6_CMD_WAIT_FOR_SERVICES=1 \
    S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0 \
    S6_SERVICES_GRACETIME=0

# Installer curl si nécessaire
RUN apk add --no-cache curl

# Copier le script d'init
COPY rootfs /
COPY config /tmp/config

# Rendre le script exécutable
RUN chmod a+x /etc/cont-init.d/99-add-custom-config.sh

# Labels
LABEL \
    io.hass.name="Prowlarr" \
    io.hass.description="Prowlarr is an indexer manager/proxy built on the popular *arr .net/reactjs base stack" \
    io.hass.arch="amd64" \
    io.hass.type="addon" \
    io.hass.version="0.1.0" \
    maintainer="BrunquersB (https://github.com/BenjaminBR)"