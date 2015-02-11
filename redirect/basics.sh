#!/bin/bash

quote-stdin() {
  read -rd '' text
  printf "«%s»\n" "$text"
}
quote-args() {
  printf "«%s»\n" "$@"
}

echo "---- file to stdin ----"
quote-stdin <data.txt

echo "---- stdout to /dev/null ----"
echo "AAAAAAAAAAHHH" >/dev/null

echo "---- new file handle ----"
f() {
  echo "hello-$RANDOM" >&3;
  cat
}
f 0<inout.txt 3>inout.txt

echo "---- put into variable ----"
VAR="$(<data.txt)"
printf '%s\n' "$VAR"

echo "---- parse into variables ----"
C=1
while read first rest; do
  printf '%s\n' "line $((C++)): ($first) $rest"
done <data.txt

echo '---- read \ ----'
read line <<<'\\wrapped\
 newline\\'
quote-args "$line"

echo '---- raw read ----'
while read -r line; do
    quote-args "$line"
done <<< 'literal \
and newline'
