# Changelog

All notable changes to this Home Assistant add-on will be documented in this file.

## [1.0.1] - 2026-01-26

### Fixed
- **Critical**: Fixed environment variable handling for YGG credentials
- Added S6-overlay service management for proper startup sequence
- Implemented configuration validation with bashio helpers
- Fixed "You need to set a valid YGG_USERNAME and YGG_PASSWORD" error

### Changed
- Switched to Home Assistant base image (ghcr.io/hassio-addons/base:16.3.2)
- Enabled S6 init system (init: true) for proper service management
- Added dedicated service script with pre-flight checks
- Improved error messages and logging during startup

### Technical
- Added /etc/s6-overlay/s6-rc.d/ygege service definition
- Implemented bashio config helpers for safer configuration access
- Binary copied from official uwucode/ygege image with multi-stage build

## [1.0.0] - 2026-01-26

### Added
- Initial release of Ygégé Home Assistant add-on
- High-performance YGG Torrent indexer based on uwucode/ygege Docker image
- Built-in Cloudflare bypass (no FlareSolverr required)
- Automatic YGG domain resolution
- IMDB metadata integration support
- TMDB metadata integration support
- RESTful API for programmatic access
- Web interface for manual searching
- Prowlarr integration compatibility
- Health check endpoint
- Configurable logging levels
- Minimal resource footprint (~15MB RAM)

### Configuration
- YGG_USERNAME: YGG Torrent account username (required)
- YGG_PASSWORD: YGG Torrent account password (required)
- log_level: Logging verbosity (info, debug, warning, error)
- imdb_enabled: Toggle IMDB metadata integration
- tmdb_enabled: Toggle TMDB metadata integration

### Architecture
- amd64 support only (Rust binary compatibility)

### Documentation
- Comprehensive README with installation and usage instructions
- API documentation available at /api endpoint
- Troubleshooting guide included
- Prowlarr and Jackett integration examples

### Notes
- Based on Ygégé by UwUDev (https://github.com/UwUDev/ygege)
- Uses official uwucode/ygege:latest Docker image
- Port 8715 exposed for web interface and API
- Config persistence via /config volume
