#!/usr/bin/with-contenv bash

echo "[INFO] Checking custom definitions..."

mkdir -p /config/Definitions/Custom

if [ ! -f /config/Definitions/Custom/ygg-api.yml ]; then
    echo "[INFO] Downloading custom YGG definitions..."
    
    curl -fsSL https://gist.githubusercontent.com/Clemv95/8bfded23ef23ec78f6678896f42a2b60/raw/f1c073f1994ab9c5c13ab68fa463ac2c862299c8/ygg-api-download.yml \
        -o /config/Definitions/Custom/ygg-api.yml
    
    curl -fsSL https://raw.githubusercontent.com/Jackett/Jackett/master/src/Jackett.Common/Definitions/yggtorrent.yml \
        -o /config/Definitions/Custom/yggtorrent.yml
    
    curl -fsSL https://raw.githubusercontent.com/Jackett/Jackett/master/src/Jackett.Common/Definitions/yggcookie.yml \
        -o /config/Definitions/Custom/yggcookie.yml
    
    echo "[INFO] Custom definitions installed!"
else
    echo "[INFO] Custom definitions already exist"
fi

if [ ! -f /config/Definitions/Custom/ygege.yml ]; then
    echo "[INFO] Downloading custom YGG definitions..."
    
    curl -fsSL https://raw.githubusercontent.com/UwUDev/ygege/refs/heads/develop/ygege.yml \
        -o /config/Definitions/Custom/ygege.yml
    
    echo "[INFO] Custom definitions installed!"
else
    echo "[INFO] Custom definitions already exist"
fi