#!/bin/bash

NOTMY_VAR="someone's else"
MY_VAR="var"
MY_OTHER="other"
LINK="MY_VAR"

quote-args() {
  (( $# )) && printf "«%s»\n" "$@"
}

echo '---- length ----'
echo "MY_VAR has length ${#MY_VAR}"

echo '---- names ----'
echo "my vars: ${!MY_*}"

echo '---- indirection ----'
echo "linked value: ${!LINK}"

echo '---- indirection 2 ----'
LINK="@"
set -- 1 2 3
quote-args "${!LINK}"
