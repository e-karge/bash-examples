#!/bin/bash

f() {
  (( $# )) || return
  local LOCAL="$1"
  GLOBAL="$1"
  shift
  f "$@"
  printf '%s\n' "$LOCAL:$GLOBAL"
}

f 1 2 3
