#!/bin/bash

# autoscan.sh - A script for automatically scanning from a printer/scanner and saving to a random file.

# Must be set to your printer's address. Use `scanimage -L` to get a list of printers.
PRINTER="hpaio:/net/OfficeJet_4650_series?ip=192.168.0.100"

# Optional variables, feel free to adjust.
TIME=30   	# TIME (in seconds), should be at least 10.
FORMAT=jpg	# FORMAT must be understood by mogrify. Ex: jpg, png, tiff, bmp.
QUALITY=200	# QUALITY must be supported by your printer. Common ones are 300, 200, 150, and 75.




if [ ! -f /usr/bin/scanimage ]; then
    echo "This script requires the \`scanimage\` command, which was not found. Exiting. "
    exit 1
fi
if [ ! -f /usr/bin/mogrify ]; then
    echo "This script requires the \`mogrify\` command from the \`imagemagick\` package, which was not found. Exiting. "
    exit 2
fi

echo " "
echo "Computer will start automatically scanning in a few seconds... "
SLTIME=$(($TIME-5))
sleep 5

while true; do
    FILENAME=$(mktemp -u XXXXXX)
    echo " "
    echo "Scanning and saving to $FILENAME.$FORMAT... "
    scanimage -d $PRINTER --mode Color --resolution $QUALITY --format tiff > $FILENAME.tiff 2>/dev/null
    mogrify -format $FORMAT $FILENAME.tiff
    rm $FILENAME.tiff
    echo " "
    echo "Done scanning $FILENAME.$FORMAT, waiting $TIME seconds for next scan... "
    sleep $SLTIME
    echo " "
    echo "5... "
    sleep 1
    echo "4... "
    sleep 1
    echo "3... "
    sleep 1
    echo "2... "
    sleep 1
    echo "1... "
    sleep 1
done












