#!/usr/bin/env bash
# exit on error
set -o errexit

set -x


gem update --system --verbose

echo "=== ACTIVE KEYS ==="
echo "Primary: ${ACTIVE_RECORD_ENCRYPTION_PRIMARY_KEY:0:6}..." # First 6 chars
echo "Deterministic: ${ACTIVE_RECORD_ENCRYPTION_DETERMINISTIC_KEY:0:6}..."
echo "Salt: ${ACTIVE_RECORD_ENCRYPTION_KEY_DERIVATION_SALT:0:6}..."


bundle check || bundle install
echo "Verifying encryption configuration..."
bundle exec rails runner 'puts "Encryption config:", ActiveRecord::Encryption.config.inspect'
echo "=== PRECOMPILING ASSETS ==="
bundle exec rails assets:precompile --trace
echo "=== CLEANING ASSETS ==="
bundle exec rails assets:clean --trace
echo "=== RUNNING MIGRATIONS ==="
bundle exec rails db:migrate --trace

