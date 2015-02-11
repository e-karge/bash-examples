#!/bin/bash

quote-stdin() {
  read -rd '' text
  printf "«%s»\n" "$text"
}

VARS=variables

quote-stdin <<MEINMARKER
this text is send to stdin
$VARS are expanded
"quoting" is ignored
\\ backslash escapes \$
MEINMARKER
