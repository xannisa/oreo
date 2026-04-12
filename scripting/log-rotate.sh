#!/bin/bash

set -e

LOG_DIR="/Users/khairunnisa/Documents/Belajar/mefx/oreo/scripting/logs"
ARCHIVE_DIR="$LOG_DIR/archive"
LOG_FILE="/Users/khairunnisa/Documents/Belajar/mefx/oreo/scripting/logs/logrotate_script.log"
MAX_SIZE=$((5 * 1024 * 1024)) # 5 MB

mkdir -p "$ARCHIVE_DIR"

echo "[$(date)] Starting log rotation..." >> "$LOG_FILE"

for file in "$LOG_DIR"/*.log; do
    [ -e "$file" ] || continue

    size=$(stat -f%z "$file")

    if [ "$size" -gt "$MAX_SIZE" ]; then
        timestamp=$(date +"%Y%m%d_%H%M%S")
        filename=$(basename "$file")
        archive_file="$ARCHIVE_DIR/${filename}_$timestamp.gz"

        echo "[$(date)] Rotating $file (size: $size bytes)" >> "$LOG_FILE"

        gzip -c "$file" > "$archive_file"
        : > "$file"

        echo "[$(date)] Archived to $archive_file and truncated $file" >> "$LOG_FILE"
    fi
done

echo "[$(date)] Log rotation finished." >> "$LOG_FILE"