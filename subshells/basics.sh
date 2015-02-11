#!/bin/bash

echo '---- () ----'
VAR="not replaced"
(
    VAR="${VAR#not }"
    echo "VAR was $VAR in subshell"
)
echo "VAR was $VAR"

echo '---- not a subshell: {} ----'
VAR="not replaced"
{
    VAR="${VAR#not }"
    echo "VAR was $VAR in subshell"
}
echo "VAR was $VAR"

echo '---- not a subshell: {} 1>&2 ----'
VAR="not replaced"
{ {
    VAR="${VAR#not }"
    echo "VAR was $VAR in subshell"
} 1>&2
} 2>&1
echo "VAR was $VAR"

echo '---- but: {} | cat ----'
VAR="not replaced"
{
    VAR="${VAR#not }"
    echo "VAR was $VAR in subshell"
} | cat
echo "VAR was $VAR"

echo '---- loops with pipes ----'
VAR="not replaced"
echo 1 | while read; do
    VAR="${VAR#not }"
    echo "VAR was $VAR in subshell"
done
echo "VAR was $VAR"

echo '---- jobs ----'
VAR="not replaced"
VAR="${VAR#not }" &
wait %1
echo "VAR was $VAR"

echo '---- not a subshell: standart function ----'
VAR="not replaced"
f() {
    VAR="${VAR#not }"
    echo "VAR was $VAR in subshell"
}
f
echo "VAR was $VAR"

echo '---- subshell function ----'
VAR="not replaced"
f() (
    VAR="${VAR#not }"
    echo "VAR was $VAR in subshell"
)
f
echo "VAR was $VAR"
