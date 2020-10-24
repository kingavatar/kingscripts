#!/bin/zsh
# vim: ft=zsh fdm=marker foldlevel=0 sw=2 ts=2 sts=2 et
#
# SSH
# References:
#   https://github.com/Powerlevel9k/powerlevel9k/blob/next/segments/ssh/ssh.p9k

SPACESHIP_SSH_COLOR="${SPACESHIP_SSH_COLOR="202"}" # orangered1
SPACESHIP_SSH_SYMBOL="${SPACESHIP_SSH_SYMBOL=" "}"
SPACESHIP_SSH_PREFIX="${SPACESHIP_SSH_PREFIX=""}"
SPACESHIP_SSH_SUFFIX="${SPACESHIP_SSH_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"

# Displays an SSH icon when connected.
spaceship_ssh() {
  if [[ -n "$SSH_CONNECTION" ]] || [[ -n "$SSH_TTY" ]]; then
    spaceship::section \
      "$SPACESHIP_SSH_COLOR" \
      "$SPACESHIP_SSH_SYMBOL" \
      "$SPACESHIP_SSH_PREFIX" \
      "$SPACESHIP_SSH_SUFFIX"
  fi
}

