#!/bin/bash

quote-line() {
  printf "«%s»\n" "$1"
}

VAR="a\ variable"

quote-line \cha\rac\te\rs\ are\ literal\ if\ prefixed\ with\ \$\\
quote-line newline\
\ is\ special
