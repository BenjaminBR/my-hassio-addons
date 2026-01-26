#!/usr/bin/env bash
set -e

CONFIG_PATH=/data/options.json

echo "[INFO] Starting Ygégé addon..."

# Check if config exists
if [[ ! -f "${CONFIG_PATH}" ]]; then
    echo "[ERROR] Configuration file not found: ${CONFIG_PATH}"
    exit 1
fi

# Read configuration
YGG_USERNAME=$(jq --raw-output '.ygg_username // empty' ${CONFIG_PATH})
YGG_PASSWORD=$(jq --raw-output '.ygg_password // empty' ${CONFIG_PATH})
LOG_LEVEL=$(jq --raw-output '.log_level // "info"' ${CONFIG_PATH})
TMDB_TOKEN=$(jq --raw-output '.tmdb_token // empty' ${TMDB_TOKEN})

# Validate required configuration
if [[ -z "${YGG_USERNAME}" ]]; then
    echo "[ERROR] YGG_USERNAME is not configured!"
    echo "[ERROR] Please configure your YGG username in the addon configuration."
    exit 1
fi

if [[ -z "${YGG_PASSWORD}" ]]; then
    echo "[ERROR] YGG_PASSWORD is not configured!"
    echo "[ERROR] Please configure your YGG password in the addon configuration."
    exit 1
fi

echo "[INFO] Configuration validated successfully"
echo "[INFO] Starting Ygégé with user: ${YGG_USERNAME}"

# Export environment variables for the application
export YGG_USERNAME="${YGG_USERNAME}"
export YGG_PASSWORD="${YGG_PASSWORD}"
export LOG_LEVEL="${LOG_LEVEL}"
export TMDB_TOKEN="${TMDB_TOKEN}"
export BIND_IP="0.0.0.0"
export BIND_PORT="8715"

# Start the application
exec /app/ygege
