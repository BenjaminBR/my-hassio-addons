# Changelog

All notable changes to this add-on will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2025-11-14

### Added
- Initial release of Prowlarr Home Assistant add-on
- Based on LinuxServer.io Prowlarr image version 2.1.5
- Pre-installed YGGTorrent custom indexer definitions:
  - YGG API indexer (API-based authentication)
  - YGGTorrent indexer (standard web scraping)
  - YGG Cookie indexer (cookie-based authentication)
- Health check endpoint configuration (30s interval)
- Bashio integration for Home Assistant compatibility
- Configurable log levels (debug, info, warning, error)
- Web UI accessible on port 9696
- Docker labels for Home Assistant integration
- S6 overlay configuration for proper service management

### Features
- Unified indexer management for torrent and usenet sources
- Automatic synchronization with Sonarr, Radarr, Lidarr, and other *arr applications
- FlareSolverr/Byparr proxy support for Cloudflare-protected indexers
- Persistent configuration storage
- amd64 architecture support

### Configuration
- Environment variables: HOST (0.0.0.0), PORT (9696)
- Optional log level configuration via add-on options
- Default boot mode: automatic startup

### Technical Details
- Base Image: `linuxserver/prowlarr:2.1.5`
- Runtime: .NET with ReactJS frontend
- S6 overlay for process supervision
- Health check: HTTP GET to `/api/v1/health` endpoint
- Dependencies: bash, curl, jq, ca-certificates, bashio v0.16.2

### Known Limitations
- amd64 architecture only (ARM not supported in this release)
- YGGTorrent indexers require valid credentials to function
- Some indexers may require FlareSolverr/Byparr for Cloudflare bypass

### Documentation
- Comprehensive README with setup instructions
- Configuration examples for common use cases
- Troubleshooting guide for common issues
- Integration guides for *arr applications

[0.1.0]: https://github.com/BenjaminBR/my-hassio-addons/releases/tag/prowlarr-v0.1.0
