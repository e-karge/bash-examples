#!/bin/bash

quote-arg() {
  printf "«%s»\n" "$1"
}

VAR="a variable"

quote-arg '(almost) everything is literal: \\ " $VAR'
quote-arg \'' is not'
quote-arg 'no line\
wrapping'
