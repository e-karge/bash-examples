#!/bin/bash

WELCOME_TO="Welcome to"

function welcome() {
  printf '%s «%s»\n' "$WELCOME_TO" "$1"
}

if [ ${1:+set} ]; then
  welcome "$1"
else
  welcome "Bash'd Practice"
fi
