# Changelog

All notable changes to this add-on will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2024-01-10

### Added
- Initial release of Byparr Home Assistant add-on
- FlareSolverr API compatibility on port 8191
- Camoufox browser engine for advanced anti-bot bypass
- FastAPI-based REST API with Swagger documentation at `/docs`
- Configuration options for log level (debug, info, warning, error)
- Proxy support with authentication (optional)
- Health check endpoint at `/health`
- Interactive Web UI for API exploration
- Full integration with Home Assistant add-on system
- Bashio configuration management
- Support for amd64 architecture

### Technical Details
- Based on upstream Byparr image: `ghcr.io/thephaseless/byparr:latest`
- Python 3.13 runtime with UV package manager
- FastAPI web framework
- Camoufox browser for realistic fingerprinting
- Minimum requirements: 2 CPU cores, 4 GB RAM

### Known Limitations
- amd64 architecture only (no ARM support in initial release)
- Resource-intensive (requires significant RAM and CPU)
- Does not guarantee bypass success for all anti-bot challenges
- May require legitimate traffic from public IP for full validation

### Integration Support
- Compatible with Prowlarr, Sonarr, Radarr, and other *arr applications
- Drop-in replacement for FlareSolverr
- Uses standard FlareSolverr API endpoints

[0.1.0]: https://github.com/ThePhaseless/Byparr/releases/tag/v0.1.0
