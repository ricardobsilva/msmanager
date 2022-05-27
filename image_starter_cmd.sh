#!/usr/bin/env bash

# Runs sidekiq in background
bundle exec sidekiq -C config/sidekiq.yml -e $RAILS_ENV &
# bundle exec sidekiq -e $RAILS_ENV &

# Migrating the database
bundle exec rails db:migrate

# Run Assets
# RAILS_ENV=$RAILS_ENV bundle exec rake assets:precompile 

# start rails
RAILS_ENV=$RAILS_ENV bundle exec puma -p 4200 -e $RAILS_ENV -C config/puma.rb