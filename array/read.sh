#!/bin/bash

declare x=0

exec < data.txt
while read "lines[x++]"; do
 :
done
set | grep ^lines=

exec <data.txt
while read -a words; do
    set | grep ^words=
done