#!/bin/bash
set -e

gems_up_to_date() {
  bundle check 1> /dev/null
}

yarn_up_to_date() {
  yarn check 1> /dev/null
}

log () {
  echo -e "\033[0;33m$(date "+%H:%M:%S")\033[0;37m ==> $1."
}

if ! gems_up_to_date; then
  log "Installing/Updating Rails dependencies (gems)"
  bundle install
  log "Gems updated"
fi

if ! yarn_up_to_date; then
  log "Installing/Updating Node dependencies (yarn)"
  yarn install
  log "Yarn updated"
fi

exec "$@"
