#!/bin/bash

print-first() {
  printf '%s\n' "$1"
}

VA="123"
VAR1="the first parameter"
VAR2="the second parameter"

print-first "$VAR1"
print-first "$VAR2"

ECHO="printf %s\n"

set -x
$ECHO hello
