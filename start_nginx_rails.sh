#!/bin/bash

set -e
ln -s /opt/rails_conf/*.yml /rails/config/

cd /rails
bundle exec rake assets:precompile
chown -R www-data:www-data /rails

/usr/bin/supervisord
