# Home Assistant Add-on: Prowlarr

![Prowlarr Logo](logo.png)

## About

Prowlarr is an indexer manager/proxy built on the popular *arr .NET/ReactJS base stack to integrate with your various PVR apps. It supports management of both Torrent Trackers and Usenet Indexers, providing a unified interface for all your indexers.

This add-on is based on the [LinuxServer.io Prowlarr](https://docs.linuxserver.io/images/docker-prowlarr) image and includes custom YGGTorrent indexer definitions for enhanced French tracker support.

## Features

- **Unified Indexer Management**: Manage all your torrent and usenet indexers in one place
- **Seamless *arr Integration**: Built-in integration with Sonarr, Radarr, Lidarr, Readarr, and more
- **Custom Indexers**: Pre-configured YGGTorrent definitions (API, Cookie, and Standard)
- **Automatic Sync**: Sync indexers across all your *arr applications automatically
- **FlareSolverr Compatible**: Works with FlareSolverr/Byparr for Cloudflare bypass
- **Health Monitoring**: Built-in health check endpoint

## Installation

1. Add this repository to your Home Assistant add-on store
2. Install the "Prowlarr" add-on
3. Configure the add-on (see Configuration section)
4. Start the add-on
5. Check the logs to verify it's running correctly
6. Access the Web UI at port 9696

## Configuration

### Basic Options

```yaml
log_level: info
```

- **log_level** (optional): Set logging verbosity
  - `debug`: Detailed debugging information
  - `info`: General information (default)
  - `warning`: Warning messages only
  - `error`: Error messages only

### Example Configuration

```yaml
log_level: info
```

## Usage

### Web Interface

Once started, Prowlarr is available at:
- **Web UI**: `http://homeassistant.local:9696`

### Initial Setup

1. Access the Web UI at port 9696
2. Complete the initial setup wizard
3. Add your indexers (YGGTorrent definitions are pre-installed)
4. Configure integration with your *arr applications
5. (Optional) Configure FlareSolverr/Byparr proxy for Cloudflare-protected indexers

### Integration with *arr Applications

#### Adding Prowlarr to Sonarr/Radarr/Lidarr

1. In Prowlarr, go to Settings → Apps
2. Click the "+" button to add an application
3. Select your application type (Sonarr, Radarr, etc.)
4. Configure:
   - **Prowlarr Server**: `http://homeassistant.local:9696`
   - **Application Server**: Your *arr app URL
   - **API Key**: From your *arr app settings
5. Test and Save

Prowlarr will automatically sync all your indexers to the connected applications.

#### Using FlareSolverr/Byparr Proxy

1. In Prowlarr, go to Settings → Indexers
2. Click "Add Indexer Proxy"
3. Select "FlareSolverr"
4. Configure:
   - **Host**: `http://homeassistant.local` (or your Byparr host)
   - **Port**: `8191`
   - **Tags**: Create tags for indexers requiring bypass
5. Test and Save
6. Apply the tag to indexers that need Cloudflare bypass

### Pre-installed Custom Indexers

This add-on includes three YGGTorrent indexer definitions:

1. **YGG API** (`ygg-api.yml`): API-based indexer with authentication
2. **YGGTorrent** (`yggtorrent.yml`): Standard web scraping indexer
3. **YGG Cookie** (`yggcookie.yml`): Cookie-based authentication indexer

These definitions are automatically available in Prowlarr's indexer list.

### Data Persistence

Prowlarr configuration and data are stored in the add-on's persistent data directory, which survives restarts and updates.

## System Requirements

- **CPU**: Minimum 1 core (2+ recommended for multiple indexers)
- **RAM**: Minimum 512 MB (1 GB+ recommended)
- **Disk**: ~200 MB for add-on, additional space for logs and cache
- **Architecture**: amd64 only

## Architecture Support

- ✅ **amd64**: Fully supported and tested
- ❌ **aarch64/armv7**: Not available in this release (can be added if needed)

## Troubleshooting

### Add-on Won't Start

1. Check system resources (CPU, RAM)
2. Review add-on logs for error messages
3. Ensure port 9696 is not in use by another service
4. Verify your system meets minimum requirements

### Cannot Access Web UI

1. Verify the add-on is running (check logs)
2. Check that port 9696 is accessible
3. Try accessing via IP: `http://[HA_IP]:9696`
4. Check firewall rules if applicable

### Indexers Not Syncing to *arr Apps

1. Verify API keys are correct in both Prowlarr and *arr apps
2. Check network connectivity between services
3. Review Prowlarr logs for sync errors
4. Ensure *arr applications are accessible from Prowlarr

### YGGTorrent Indexers Not Working

1. Verify you have valid YGGTorrent credentials
2. Check if the site is accessible from your network
3. Consider using FlareSolverr/Byparr if Cloudflare protection is active
4. Review indexer logs in Prowlarr for specific errors

## Support

- **Prowlarr Documentation**: [https://wiki.servarr.com/prowlarr](https://wiki.servarr.com/prowlarr)
- **LinuxServer.io**: [https://docs.linuxserver.io/images/docker-prowlarr](https://docs.linuxserver.io/images/docker-prowlarr)
- **Home Assistant Community**: [Home Assistant Forums](https://community.home-assistant.io/)
- **Issue Reporting**: Report add-on specific issues to the add-on repository

## Advanced Configuration

### Environment Variables

The following environment variables are pre-configured:

- `HOST=0.0.0.0`: Listen on all interfaces
- `PORT=9696`: Web UI port

### Custom Indexer Definitions

Additional custom indexer definitions can be added by:

1. Accessing the add-on's configuration directory
2. Placing `.yml` definition files in `/config/Definitions/Custom/`
3. Restarting Prowlarr

### Using External Database

For advanced users, Prowlarr supports external PostgreSQL databases. Configure via the Prowlarr Web UI under Settings → Database.

## License

- **Prowlarr**: GPL-3.0 License
- **LinuxServer.io Image**: GPL-3.0 License
- **This Add-on**: MIT License (add-on wrapper only)

## Credits

- **Prowlarr**: Created by the Prowlarr Team [https://github.com/Prowlarr/Prowlarr](https://github.com/Prowlarr/Prowlarr)
- **LinuxServer.io**: Container image maintainers [https://www.linuxserver.io/](https://www.linuxserver.io/)
- **YGGTorrent Definitions**: Community-maintained indexer definitions

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.
