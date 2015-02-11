#!/bin/bash

(( $# < 3 )) && set -- arg1 arg2 arg3

quote-args() {
  (( $# )) && printf "«%s»\n" "$@"
}

echo "---- one by one ----"

quote-args "$1" "$2" "$3"

echo "---- each ----"

quote-args "$@"

echo "---- all ----"

quote-args "$*"

echo "---- assign ----"

set -- my custom args
quote-args "$@"

echo "---- shift ----"

shift
quote-args "$@"

echo "---- shift more ----"

shift 2
quote-args "$@"
