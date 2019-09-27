#!/bin/bash
# This script requires ImageMagick to be installed.
convert input.png -resize 16x16\> favicon.png
convert input.png -resize 16x16\> favicon-16x16.png
convert input.png -resize 20x20\> favicon-20x20.png
convert input.png -resize 32x32\> favicon-32x32.png
convert input.png -resize 48x48\> favicon-48x48.png
convert favicon-16x16.png favicon-32x32.png favicon-48x48.png favicon.ico
convert input.png -resize 57x57\> apple-touch-icon-57x57.png
convert input.png -resize 60x60\> apple-touch-icon-60x60.png
convert input.png -resize 72x72\> apple-touch-icon-72x72.png
convert input.png -resize 76x76\> apple-touch-icon-76x76.png
convert input.png -resize 96x96\> apple-touch-icon-96x96.png
convert input.png -resize 100x100\> apple-touch-icon-100x100.png
convert input.png -resize 114x114\> apple-touch-icon-114x114.png
convert input.png -resize 120x120\> apple-touch-icon-120x120.png
convert input.png -resize 144x144\> apple-touch-icon-144x144.png
convert input.png -resize 152x152\> apple-touch-icon-152x152.png
convert input.png -resize 180x180\> apple-touch-icon-180x180.png
convert input.png -resize 192x192\> apple-touch-icon-192x192.png
convert input.png -resize 200x200\> apple-touch-icon-200x200.png
convert input.png -resize 200x200\> apple-touch-icon.png
