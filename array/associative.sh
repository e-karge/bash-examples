#!/bin/bash

printVar() {
    set | grep "^$1="
}

echo "---- declaration and initialization----"
declare -A ARRAY
ARRAY=( [key]=value [2]="another value" )
printVar ARRAY

echo "---- declaration is mandatory! ----"
unset ARRAY
ARRAY=([key]=value)
printVar ARRAY
unset ARRAY

echo "---- get keys ----"
declare -A ARRAY
ARRAY=( [key]=value [2]="another value" [foo and bar]="random entry" [1 + 2]="no math")
printVar ARRAY

foo=key
echo "-- ${ARRAY[$foo]} --"
