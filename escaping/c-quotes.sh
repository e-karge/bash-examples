#!/bin/bash

quote-line() {
  printf "«%s»\n" "$1"
}

VAR="a variable"

quote-line $'\'printf\' style quoting:\nnewline and\ttab
unicode: \U263A
hex: \x64
octal: \100
escape: \e[32mcolor\e[0m'
