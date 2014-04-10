#!/bin/bash

set -e
ln -s /opt/rails_conf/*.yml /rails/config/

cd /rails
bundle exec rake assets:precompile

/usr/bin/supervisord
