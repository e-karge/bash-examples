#!/bin/bash

quote-stdin() {
  read -rd '' text
  printf "«%s»\n" "$text"
}

exec <data.txt
while read first rest; do
  printf '%s\n' "line $((C++)): ($first) $rest"
done
