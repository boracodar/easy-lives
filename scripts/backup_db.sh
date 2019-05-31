#!/usr/bin/env bash

set -euxo pipefail

# Generates DB dump
heroku pg:backups:capture
heroku pg:backups:download

# Clear local DB
rails db:drop db:create db:migrate

# Restores DB dump
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d easy-lives_development latest.dump

# Updates the DB env in `ar_internal_metadata` table
rails db:environment:set

# Removes DB dump
rm latest.dump