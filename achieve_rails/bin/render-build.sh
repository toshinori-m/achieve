#!/bin/bash
set -o errexit

bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails s -p 3000 -b '0.0.0.0'
