# Ygégé Troubleshooting Guide

## Common Issues and Solutions

### 1. "You need to set a valid YGG_USERNAME and YGG_PASSWORD"

**Symptom**: Addon fails to start with error about missing credentials

**Solution**:
1. Go to Home Assistant → Settings → Add-ons → Ygégé
2. Click on **Configuration** tab
3. Fill in your YGGTorrent credentials:
   - `ygg_username`: Your YGG username
   - `ygg_password`: Your YGG password
4. Click **Save**
5. Restart the addon

**Note**: Make sure you have a valid YGGTorrent account. The addon cannot work without proper credentials.

---

### 2. "s6-overlay-suexec: fatal: can only run as pid 1" (Fixed in v1.0.2)

**Symptom**: Addon crashes immediately on startup with S6 error

**Solution**: This was fixed in version 1.0.2. Make sure you're running the latest version:
1. Go to Home Assistant → Settings → Add-ons → Ygégé
2. Click **⋮** (three dots menu)
3. Click **Rebuild**
4. Wait for the build to complete
5. Start the addon

---

### 3. Addon fails to connect to YGGTorrent

**Symptom**: Addon starts but cannot access YGG

**Possible causes**:
- Invalid credentials
- YGG website is down or blocked
- Network connectivity issues

**Solution**:
1. Verify your credentials work on the YGG website
2. Check addon logs for specific error messages
3. Ensure your Home Assistant instance has internet access
4. Check if YGG domain is accessible from your network

---

### 4. Web UI not accessible on port 8715

**Symptom**: Cannot access http://[HOST]:8715

**Solution**:
1. Check if addon is running (should show green "STARTED" status)
2. Verify port 8715 is not used by another service
3. Check Home Assistant firewall settings
4. Try accessing from Home Assistant: Settings → Add-ons → Ygégé → Open Web UI

---

### 5. High CPU or memory usage

**Symptom**: System resources heavily used by ygégé

**Solution**:
- Normal: ~15MB RAM during idle
- During searches: CPU spikes are normal
- If constantly high: Check logs for error loops
- Restart addon if necessary

---

## Useful Commands

### Check addon logs
```
Home Assistant → Settings → Add-ons → Ygégé → Logs tab
```

### View full logs
```bash
docker logs hassio_addon_local_ygege
```

### Rebuild addon
```
Home Assistant → Settings → Add-ons → Ygégé → ⋮ → Rebuild
```

---

## Configuration Reference

### Required Settings
- `ygg_username`: Your YGGTorrent account username
- `ygg_password`: Your YGGTorrent account password

### Optional Settings
- `log_level`: Logging verbosity (`debug`, `info`, `warning`, `error`)
  - Default: `info`
  - Use `debug` for troubleshooting
- `imdb_enabled`: Enable IMDB metadata (true/false)
- `tmdb_enabled`: Enable TMDB metadata (true/false)

---

## Integration with Prowlarr

1. In Prowlarr, go to **Settings** → **Indexers**
2. Click **+** to add a new indexer
3. Search for "Ygégé" or "Custom"
4. Configure:
   - **Name**: Ygégé
   - **URL**: `http://[ADDON_IP]:8715`
   - **API Path**: `/api`
5. Test and save

---

## Getting Help

If you encounter issues not covered here:

1. Check the addon logs first
2. Verify your YGG credentials work on the website
3. Try rebuilding the addon
4. Open an issue on GitHub with:
   - Addon version
   - Error message from logs
   - Steps to reproduce

---

## Version History

- **v1.0.2** (2026-01-26): Fixed S6-overlay PID 1 error
- **v1.0.1** (2026-01-26): Fixed environment variable handling (deprecated)
- **v1.0.0** (2026-01-26): Initial release
