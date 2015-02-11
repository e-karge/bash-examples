#!/bin/bash

VAR="not replaced"
exec < <(echo 1)
while read; do
    VAR="${VAR#not }"
    echo "VAR was $VAR in subshell"
done
echo "VAR was $VAR"
