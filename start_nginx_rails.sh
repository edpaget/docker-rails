#!/bin/bash

set -e

usage() {
    echo -e "
    usage: $0 options

    Configures and starts a rails app behind nginx and passenger

    OPTIONS:
      -l=PATH Path to Symlink config files (empty and ignored by default)
      -p Precompile Assets (false by default)
    "
}

CONFIG_PATH=
PRECOMPILE=false

while getopts "hpl:" OPTION
do
  case $OPTION in
    h)
      usage
      exit 1
      ;;
    p)
      PRECOMPILE=true
      ;;
    l)
      CONFIG_PATH=$OPTARG
      ;;
    ?)
      usage
      exit 1
      ;;
  esac
done

if [[ -z $CONFIG_APTH ]];
then
  ln -sf "$CONFIG_PATH*.yml" /rails/config/
fi

if [ "$PRECOMPILE" = true ];
then
  cd /rails
  bundle exec rake assets:precompile
fi

chown -R www-data:www-data /rails

/usr/bin/supervisord
