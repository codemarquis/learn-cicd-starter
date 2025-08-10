#!/usr/bin/env bash
set -euo pipefail

# Load .env if present (local dev)
if [ -f .env ]; then
  echo "Loading environment from .env"
  export $(grep -v '^#' .env | xargs)
else
  echo ".env file not found — assuming CI/CD environment variables are set"
fi

# Check required env vars
if [ -z "${DATABASE_URL:-}" ]; then
  echo "❌ Error: DATABASE_URL is not set"
  exit 1
fi

echo "✅ Running migrations with goose..."
goose turso "$DATABASE_URL" up
echo "✅ Migrations complete!"
