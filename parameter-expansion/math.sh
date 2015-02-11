#!/bin/bash

ONE="9 / 3 - 2"
LINK1=ONE
LINK2=LINK1
GARBAGE="!"

echo "ONE: $((ONE * 2))"
echo "LINKED: $((LINK2))"
set -- 1 2 3 4
echo "SPECIALS: $(($#))"
echo "MATH: $((1 + 2 * 3))"
echo "GARBAGE: $((GARBAGE))"

(( 0 )); echo "((0)) returns $?"
(( 4 )); echo "((4)) returns $?"

for ((i = 0; i < 3; ++i)); do
    echo "i = $i"
done
