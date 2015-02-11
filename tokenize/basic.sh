#!/bin/bash

quote-args() {
  printf "«%s»\n" "$@"
}

VAR="lots of whitespace
seperated text"

quote-args $VAR

echo "---- empty IFS ----"

IFS=''
quote-args $VAR

echo "---- custom IFS ----"

IFS='wa'
quote-args $VAR

echo "---- parsing a path ----"

IFS='/'
quote-args $PWD

echo "---- parsing a path list ----"

IFS=:
quote-args $PATH

echo "---- join ----"
set -- 1 2 3 4
IFS=:
printf '«%s»\n' "$*"

echo "---- concat ----"
set -- 1 2 3 4
IFS=
printf '«%s»\n' "$*"

echo "---- avoid join ----"
IFS=:
printf '«%s»\n' "$@"
