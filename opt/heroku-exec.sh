#!/usr/bin/env bash

if [ -n "$HEROKU_EXEC_URL" ]; then
  export HEROKU_EXEC_URL="$(echo "$HEROKU_EXEC_URL" | sed s/heroku-exec\./heroku-exec-staging\./)"
  [ -z "$SSH_CLIENT" ] && source <(curl -sSL $HEROKU_EXEC_URL)
fi
