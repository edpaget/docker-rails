#!/bin/bash

set -e

usage() {
    echo -e "
    usage: $0 options

    Configures and starts a rails app behind nginx and passenger

    OPTIONS:
    -p Precompile Assets (false by default)
    "
}

PRECOMPILE=false

while getopts "hp" OPTION
do
  case $OPTION in
    h)
      usage
      exit 1
      ;;
    p)
      PRECOMPILE=true
      ;;
    ?)
      usage
      exit 1
      ;;
  esac
done

ln -sf /opt/rails_config/*.yml /rails/config/

if [ "$PRECOMPILE" = true ];
then
  cd /rails
  bundle exec rake assets:precompile
fi

chown -R www-data:www-data /rails

/usr/bin/supervisord
