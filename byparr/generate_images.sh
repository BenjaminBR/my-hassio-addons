#!/bin/bash
# Script to convert SVG files to PNG for Home Assistant add-on

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Converting SVG to PNG..."

# Check if imagemagick is available
if command -v convert &> /dev/null; then
    echo "Using ImageMagick convert..."
    convert -background none -resize 256x256 icon.svg icon.png
    convert -background none -resize 256x256 logo.svg logo.png
    echo "✓ Images generated successfully with ImageMagick"
elif command -v inkscape &> /dev/null; then
    echo "Using Inkscape..."
    inkscape --export-type=png --export-width=256 --export-height=256 icon.svg -o icon.png
    inkscape --export-type=png --export-width=256 --export-height=256 logo.svg -o logo.png
    echo "✓ Images generated successfully with Inkscape"
elif command -v rsvg-convert &> /dev/null; then
    echo "Using rsvg-convert..."
    rsvg-convert -w 256 -h 256 icon.svg -o icon.png
    rsvg-convert -w 256 -h 256 logo.svg -o logo.png
    echo "✓ Images generated successfully with rsvg-convert"
else
    echo "❌ Error: No SVG converter found!"
    echo "Please install one of the following:"
    echo "  - ImageMagick: sudo apt install imagemagick"
    echo "  - Inkscape: sudo apt install inkscape"
    echo "  - librsvg: sudo apt install librsvg2-bin"
    exit 1
fi

# Verify files were created
if [[ -f "icon.png" ]] && [[ -f "logo.png" ]]; then
    echo "✓ icon.png and logo.png created successfully"
    ls -lh icon.png logo.png
else
    echo "❌ Error: PNG files were not created"
    exit 1
fi
