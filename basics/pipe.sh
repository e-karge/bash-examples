#!/bin/bash

quote() {
  printf "«%s»" "$1"
}

printf "push me around" | {
  read text
  printf "%s was pushed around" "$(quote "$text")"
}
