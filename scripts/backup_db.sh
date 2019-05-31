#! /bin/bash

set -euxo pipefail

# Generate DB dump
heroku pg:backups:capture
heroku pg:backups:download

# Clear local DB
rails db:drop db:create

# Restore DB dump
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d easy-lives_development latest.dump
