# Home Assistant Add-on: Ygégé

![Ygégé Logo](logo.png)

## About

Ygégé is a high-performance indexer for YGG Torrent written in Rust. It provides automatic torrent searching and indexing with intelligent Cloudflare bypass, eliminating the need for external proxy services like FlareSolverr.

This add-on packages Ygégé for easy deployment in Home Assistant, providing a powerful alternative or complement to traditional indexer managers.

## Features

- **Automatic Cloudflare Bypass**: Built-in intelligent Cloudflare protection bypass without external dependencies
- **Near-Instant Search**: High-performance Rust implementation with minimal memory footprint
- **Automatic Domain Resolution**: Automatically finds and uses working YGG Torrent domains
- **Session Management**: Transparent session handling with automatic reconnection
- **Rich Metadata**: IMDB and TMDB integration for enhanced torrent information
- **RESTful API**: Full-featured API for integration with other applications
- **Web Interface**: Clean, user-friendly web UI for manual searches
- **Prowlarr Compatible**: Can be added as a custom indexer in Prowlarr
- **Minimal Resources**: Only ~15MB memory footprint

## Installation

1. Add this repository to your Home Assistant add-on store
2. Install the "Ygégé" add-on
3. Configure your YGG Torrent credentials (see Configuration section)
4. Start the add-on
5. Check the logs to verify it's running correctly
6. Access the Web UI at port 8715

## Configuration

### Basic Options

```yaml
log_level: info
imdb_enabled: true
tmdb_enabled: true
ygg_username: "your_username"
ygg_password: "your_password"
```

### Configuration Parameters

- **log_level** (optional): Set logging verbosity
  - `debug`: Detailed debugging information
  - `info`: General information (default)
  - `warning`: Warning messages only
  - `error`: Error messages only

- **imdb_enabled** (optional): Enable IMDB metadata integration
  - `true`: Enable IMDB data (default)
  - `false`: Disable IMDB integration

- **tmdb_enabled** (optional): Enable TMDB metadata integration
  - `true`: Enable TMDB data (default)
  - `false`: Disable TMDB integration

- **ygg_username** (required): Your YGG Torrent account username
- **ygg_password** (required): Your YGG Torrent account password

### Example Configuration

```yaml
log_level: info
imdb_enabled: true
tmdb_enabled: true
```

**Note**: YGG credentials are configured through the Home Assistant add-on UI for security.

## Usage

### Web Interface

Once started, Ygégé is available at:
- **Web UI**: `http://homeassistant.local:8715`
- **API Documentation**: `http://homeassistant.local:8715/api`

### API Endpoints

Ygégé provides a comprehensive REST API:

- `GET /api/search?q={query}` - Search torrents by name
- `GET /api/torrent/{id}` - Get detailed torrent information
- `GET /api/health` - Health check endpoint

Full API documentation is available at the `/api` endpoint once the add-on is running.

### Integration with Prowlarr

You can add Ygégé as a custom indexer in Prowlarr:

1. In Prowlarr, go to Settings → Indexers
2. Click "+" to add a new indexer
3. Select "Generic Newznab" or create a custom definition
4. Configure:
   - **Name**: Ygégé
   - **URL**: `http://homeassistant.local:8715`
   - **API Path**: `/api/search`
5. Test and Save

### Integration with Jackett

Ygégé can also work alongside or replace Jackett for YGG Torrent indexing:

1. Use Ygégé's API directly from your download clients
2. Configure Sonarr/Radarr to use Ygégé's API endpoints
3. Benefit from built-in Cloudflare bypass without FlareSolverr

### Searching Torrents

#### Via Web Interface
1. Navigate to `http://homeassistant.local:8715`
2. Enter your search query
3. Browse results with metadata (size, seeders, leechers)
4. Click torrent links to download or view details

#### Via API
```bash
# Search for torrents
curl "http://homeassistant.local:8715/api/search?q=ubuntu"

# Get torrent details
curl "http://homeassistant.local:8715/api/torrent/12345"

# Health check
curl "http://homeassistant.local:8715/api/health"
```

## System Requirements

- **CPU**: Minimal (single core sufficient)
- **RAM**: 64 MB minimum (typically uses ~15 MB)
- **Disk**: ~50 MB for add-on
- **Architecture**: amd64 only
- **Network**: Internet access to YGG Torrent domains

## Architecture Support

- ✅ **amd64**: Fully supported and tested
- ❌ **aarch64/armv7**: Not available (Rust binary compatibility)

## Troubleshooting

### Add-on Won't Start

1. Verify YGG Torrent credentials are correct
2. Check system resources (should be minimal)
3. Review add-on logs for error messages
4. Ensure port 8715 is not in use by another service

### Cannot Access Web UI

1. Verify the add-on is running (check logs)
2. Check that port 8715 is accessible
3. Try accessing via IP: `http://[HA_IP]:8715`
4. Check firewall rules if applicable

### Search Returns No Results

1. Verify your YGG Torrent account is active
2. Check if YGG Torrent is accessible from your network
3. Review logs for Cloudflare bypass status
4. Ensure your search terms are valid

### Connection Issues to YGG Torrent

Ygégé handles most connection issues automatically:
- **Cloudflare Protection**: Automatically bypassed
- **Domain Changes**: Automatically detected and updated
- **Session Expiry**: Automatically reconnected

If problems persist:
1. Check logs for specific error messages
2. Verify your YGG account credentials
3. Ensure your network can access YGG Torrent domains
4. Wait a few minutes for automatic recovery mechanisms

### High Memory Usage

Ygégé is designed to be extremely lightweight (~15 MB typical usage). If you see higher memory usage:
1. Check for unusual log levels (debug mode uses more memory)
2. Review concurrent search operations
3. Restart the add-on to clear any cached data

## Advanced Features

### Metadata Integration

Ygégé automatically enriches torrent results with:
- **IMDB Data**: Movie ratings, descriptions, cast information
- **TMDB Data**: Movie/TV show metadata, posters, release dates
- **Torrent Stats**: Real-time seeders, leechers, and comments

Toggle these features in configuration to optimize performance or reduce external API calls.

### Cloudflare Bypass

Unlike traditional scrapers, Ygégé includes intelligent Cloudflare bypass:
- No FlareSolverr or external proxy needed
- Automatic challenge solving
- Session cookie management
- DNS spoofing countermeasures

### Session Persistence

Ygégé maintains YGG Torrent sessions efficiently:
- Automatic session renewal before expiration
- Secure credential storage
- Reconnection with exponential backoff
- Session state preserved across restarts

## Performance Characteristics

- **Search Speed**: Typically <500ms for most queries
- **Memory Usage**: ~15 MB steady state
- **CPU Usage**: Minimal (<1% typical)
- **Concurrent Searches**: Handles multiple simultaneous requests
- **Startup Time**: <5 seconds

## Security Considerations

- **Credentials**: Stored securely in Home Assistant's protected storage
- **API Access**: Consider using reverse proxy with authentication for external access
- **Updates**: Keep add-on updated for security patches
- **Network**: Ygégé only connects to YGG Torrent domains

## Comparison with Other Solutions

### Ygégé vs Prowlarr
- **Pros**: Lower resource usage, built-in Cloudflare bypass, faster searches
- **Cons**: YGG-only (Prowlarr supports multiple indexers)
- **Use Case**: Perfect for YGG-focused setups or as complement to Prowlarr

### Ygégé vs Jackett
- **Pros**: No FlareSolverr dependency, automatic domain handling, modern API
- **Cons**: YGG-only (Jackett supports multiple trackers)
- **Use Case**: Superior YGG experience without proxy complexity

### Ygégé vs Manual YGG Access
- **Pros**: API access, automation-friendly, no Cloudflare hassle, metadata enrichment
- **Cons**: Requires server resources (though minimal)
- **Use Case**: Essential for automated download setups (*arr stack)

## Support

- **Ygégé Documentation**: [https://ygege.lila.ws](https://ygege.lila.ws)
- **API Documentation**: `http://[HA_IP]:8715/api` (when running)
- **Ygégé GitHub**: [https://github.com/UwUDev/ygege](https://github.com/UwUDev/ygege)
- **Home Assistant Community**: [Home Assistant Forums](https://community.home-assistant.io/)
- **Issue Reporting**: Report add-on specific issues to the add-on repository

## FAQ

### Q: Do I need FlareSolverr with Ygégé?
**A**: No, Ygégé includes built-in Cloudflare bypass. FlareSolverr is not required.

### Q: Can I use Ygégé with Prowlarr?
**A**: Yes, you can add Ygégé as a custom indexer in Prowlarr for enhanced YGG integration.

### Q: Does this work with private YGG accounts?
**A**: Yes, Ygégé is designed for YGG Torrent accounts and handles authentication automatically.

### Q: Can I run multiple instances?
**A**: Yes, though typically unnecessary. Each instance requires separate credentials.

### Q: What happens if YGG changes domains?
**A**: Ygégé automatically detects and adapts to domain changes without manual intervention.

## License

- **Ygégé**: MIT License - [https://github.com/UwUDev/ygege](https://github.com/UwUDev/ygege)
- **This Add-on**: MIT License (add-on wrapper only)

## Credits

- **Ygégé**: Created by UwUDev [https://github.com/UwUDev](https://github.com/UwUDev)
- **Rust**: Built with Rust for maximum performance and safety
- **YGG Torrent**: French private tracker community

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.
