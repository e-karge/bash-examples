#!/bin/bash

quote-stdin() {
  read -rd '' text
  printf "«%s»\n" "$text"
}

VAR="push me around"
quote-stdin <<<"$VAR"
