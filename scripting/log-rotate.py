import os
import gzip
import shutil
from datetime import datetime

LOG_DIR = "/Users/khairunnisa/Documents/Belajar/mefx/oreo/scripting/logs"
ARCHIVE_DIR = os.path.join(LOG_DIR, "archive")
LOG_FILE = "/Users/khairunnisa/Documents/Belajar/mefx/oreo/scripting/logs/logrotate_script.log"
MAX_SIZE = 5 * 1024 * 1024  # 5 MB


def log(message):
    with open(LOG_FILE, "a") as f:
        f.write(f"[{datetime.now()}] {message}\n")


def rotate_logs():
    os.makedirs(ARCHIVE_DIR, exist_ok=True)

    log("Starting log rotation...")

    for filename in os.listdir(LOG_DIR):
        if not filename.endswith(".log"):
            continue

        filepath = os.path.join(LOG_DIR, filename)

        if not os.path.isfile(filepath):
            continue

        size = os.path.getsize(filepath)

        if size > MAX_SIZE:
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            archive_name = f"{filename}_{timestamp}.gz"
            archive_path = os.path.join(ARCHIVE_DIR, archive_name)

            log(f"Rotating {filepath} (size: {size} bytes)")

            # Compress file
            with open(filepath, 'rb') as f_in:
                with gzip.open(archive_path, 'wb') as f_out:
                    shutil.copyfileobj(f_in, f_out)

            # Truncate original file
            open(filepath, 'w').close()

            log(f"Archived to {archive_path} and truncated {filepath}")

    log("Log rotation finished.")


if __name__ == "__main__":
    rotate_logs()