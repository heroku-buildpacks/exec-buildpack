#!/usr/bin/env bash

if [ -n "$HEROKU_EXEC_URL" ]; then
  export HEROKU_EXEC_URL="$(echo "$HEROKU_EXEC_URL" | sed s/heroku-exec\.herokuapp/heroku-exec-staging\.herokuapp/)"
  [ -z "$SSH_CLIENT" ] && source <(curl --retry 3 -sSL $HEROKU_EXEC_URL)
fi
