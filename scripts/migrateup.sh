#!/bin/bash

# Load environment variables from .env if present
if [ -f .env ]; then
    source .env
fi

# Navigate to migration files directory — adjust if your migrations live somewhere else
cd sql/schema || exit 1

# Run goose migration with explicit path to goose binary (to avoid path issues)
"$HOME/go/bin/goose" turso "$DATABASE_URL" up
