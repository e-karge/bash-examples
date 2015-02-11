#!/bin/bash

quote-args() {
  (( $# )) && printf "«%s»\n" "$@"
}

VAR="my parameter"
EMPTY=

echo '---- simple ----'
quote-args "$VAR"
quote-args "$EMPTY"
quote-args $EMPTY

echo '---- safe ----'
quote-args "${VAR}"

echo '---- alternative if empty ----'
quote-args "${VAR:-use if is empty}"
quote-args "${EMPTY:-use if is empty}"
quote-args "${UNDEFINED:-use if is empty}"

echo '---- alternative if undefined ----'
quote-args "${VAR-use if is undefined}"
quote-args "${EMPTY-use if is undefined}"
quote-args "${UNDEFINED-use if is undefined}"

echo '---- test empty ----'
quote-args "VAR${VAR:+ is not empty}"
quote-args "EMPTY${EMPTY:+ is not empty}"
quote-args "UNDEFINED ${UNDEFINED:+ is not empty}"

echo '---- test undefined ----'
quote-args "VAR${VAR+ is defined}"
quote-args "EMPTY${EMPTY+ is defined}"
quote-args "UNDEFINED ${UNDEFINED+ is defined}"

echo '---- assert ----'
quote-args "VAR: ${VAR?must be defined}"
quote-args "VAR: ${UNDEFINED?must be defined}"
