#!/usr/bin/env bash
# exit on error
set -o errexit

set -x


gem update --system --verbose

echo "=== VERIFYING ENCRYPTION KEYS ==="
if [ -z "$ACTIVE_RECORD_ENCRYPTION_PRIMARY_KEY" ]; then
  echo "ERROR: Missing encryption keys!" >&2
  exit 1
fi


bundle install --verbose
echo "Verifying encryption configuration..."
bundle exec rails runner 'puts "Encryption config:", ActiveRecord::Encryption.config.inspect'
echo "=== PRECOMPILING ASSETS ==="
bundle exec rails assets:precompile --trace
echo "=== CLEANING ASSETS ==="
bundle exec rails assets:clean --trace
echo "=== RUNNING MIGRATIONS ==="
bundle exec rails db:migrate --trace

