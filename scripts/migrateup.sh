#!/bin/bash
set -e

if [ -f .env ]; then
    source .env
fi

cd sql/schema
goose turso $DATABASE_URL up
