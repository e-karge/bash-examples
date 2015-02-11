#!/bin/bash

quote-args() {
  (( $# )) && printf "«%s»\n" "$@"
}

VAR="my parameter"
EMPTY=

echo '---- substring ----'
quote-args "${VAR:3}"
quote-args "${VAR:3:5}"
quote-args "${VAR:0:-4}"
quote-args "${VAR: -5}"
quote-args "${VAR: -5:3}"
quote-args "${VAR: -7:-4}"

echo '---- remove front ----'
quote-args "${VAR#my }"
quote-args "${VAR#* }"
quote-args "${VAR#*e}"
quote-args "${VAR##*e}"

echo '---- remove back ----'
quote-args "${VAR% parameter}"
quote-args "${VAR% *}"
quote-args "${VAR%e*}"
quote-args "${VAR%%e*}"

echo '---- replace ----'
quote-args "${VAR/my/you}"
quote-args "${VAR/e/ä}"
quote-args "${VAR//e/ä}"
quote-args "${VAR//e?/e}"

echo '---- to lower/to upper ----'
quote-args "${VAR^^}"
quote-args "${VAR^^p}"
VAR="ABC"
quote-args "${VAR,,}"
quote-args "${VAR,,B}"
