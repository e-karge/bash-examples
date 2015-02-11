#!/bin/bash

quote-stdin() {
  read -rd '' text
  printf "«%s»\n" "$text"
}

echo ---- named piped ----
echo <(:)

echo ---- pass named piped ----
cat <(echo "hello")


echo ---- connect named piped ----
quote-stdin 0< <(echo "hello")

echo hello > >(cat >&2)
