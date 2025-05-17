#!/usr/bin/env bash
# exit on error
set -o errexit

set -x


gem update --system --verbose
bundle install --verbose
echo "Verifying encryption configuration..."
bundle exec rails runner 'puts "Encryption config:", ActiveRecord::Encryption.config.inspect'
echo "=== PRECOMPILING ASSETS ==="
bundle exec rails assets:precompile --trace
echo "=== CLEANING ASSETS ==="
bundle exec rails assets:clean --trace
echo "=== RUNNING MIGRATIONS ==="
bundle exec rails db:migrate --trace

