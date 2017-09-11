#!/usr/bin/env bash


if [ -n "$HEROKU_EXEC_URL" ] && [ -z "$SSH_CLIENT" ]; then
  export HEROKU_EXEC_URL="$(echo "$HEROKU_EXEC_URL" | sed s/heroku-exec\.herokuapp/heroku-exec-staging\.herokuapp/)"
  sshd_pid="$(ps -C sshd -o pid=)"
  ssh_pid="$(ps -C ssh -o pid=)"
  [ -n "$sshd_pid" ] && kill -9 "$sshd_pid"
  [ -n "$ssh_pid" ] && kill -9 "$ssh_pid"
  source <(curl --fail -sSL "$HEROKU_EXEC_URL")
fi
