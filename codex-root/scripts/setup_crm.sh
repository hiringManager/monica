#!/bin/bash
set -e

# This script automates the steps described in docs/MONICA-CRM.md
# It clones a monica CRM fork, applies patches and runs migrations.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="$ROOT_DIR/monica-crm"
REPO_URL="${1:-https://github.com/YOURUSER/monica-crm.git}"

if [ ! -d "$TARGET_DIR" ]; then
  echo "Cloning Monica CRM repo from $REPO_URL"
  git clone "$REPO_URL" "$TARGET_DIR"
else
  echo "Target directory $TARGET_DIR already exists, skipping clone"
fi

# Copy patch files
cp "$ROOT_DIR/monica-crm-patches/app/Models/Company.php" "$TARGET_DIR/app/Models/" || true
cp "$ROOT_DIR/monica-crm-patches/app/Models/Deal.php" "$TARGET_DIR/app/Models/" || true
mkdir -p "$TARGET_DIR/database/migrations"
cp "$ROOT_DIR/monica-crm-patches/database/migrations"/*.php "$TARGET_DIR/database/migrations/" || true

# Run migrations inside docker
if command -v docker >/dev/null 2>&1; then
  echo "Running migrations via docker compose"
  docker compose -f "$ROOT_DIR/docker-compose.yml" exec monica php artisan migrate
else
  echo "Docker not found. Please run migrations manually inside the container."
fi

echo "Setup complete. You can now run: docker compose -f \"$ROOT_DIR/docker-compose.yml\" up --build"
