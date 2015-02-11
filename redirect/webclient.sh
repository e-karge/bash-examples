#!/bin/bash

error() {
    printf "%s\n" "$*"
    exit 1
} 1>/dev/stderr

parseUri() {
    URI="$1"
    SCHEME="${URI%%:*}"
    [ http != "$SCHEME" ] && error "unsupported scheme: '$SCHEME': only 'http' is supported"
    AUTHORITY="${URI:7}"
    AUTHORITY="${AUTHORITY%%/*}"
    [ "${AUTHORITY//[^@]}" ] && error "authentication is unsupported"
    HOST="${AUTHORITY%%:*}"
    PORT="${AUTHORITY#"$HOST"}"
    PORT="${PORT:-:80}"
    PORT="${PORT:1}"
    URIPATH="${URI:7+${#AUTHORITY}}"
}

parseUri "$1"
exec 3<>"/dev/tcp/$HOST/$PORT" || exit
printf 'GET %s HTTP/1.0\n\n' "$URIPATH" 1>&3 || exit
cat 0<&3
