#!/bin/bash

printVar() {
    set | grep "^$1="
}

quoteln() {
    printf '«%s»\n' "$*"
}

echo "---- initialize empty ----"
ARRAY=()
printVar ARRAY

echo "---- initialize ----"
ARRAY=( 0th "1st" [3]=3rd "4th" [2]="2nd"  )
printVar ARRAY

echo "---- set an entry ----"
ARRAY[10]="tenth"
printVar ARRAY

echo "---- get an entry ----"
quoteln "${ARRAY[4]}"

echo "---- unset entry ----"
unset ARRAY[4]
printVar ARRAY

echo "---- math! ----"
ARRAY=( [0]="0th" [1]="1st" "2nd" [4]="4th" [3]="3rd" )
ARRAY[9 + 1]="tenth"
unset 'ARRAY[6 / 2]'
printVar ARRAY

echo "---- get indices ----"
ARRAY=( 0th 1st 2nd 3rd 4th )
quoteln "${!ARRAY[@]}"

echo "---- get values ----"
ARRAY=( 0th 1st 2nd 3rd 4th )
quoteln "${ARRAY[@]}"

echo "---- count ----"
ARRAY=( 0th [3]=3rd 4th )
quoteln "${#ARRAY[@]}"

echo "---- append entry ----"
ARRAY=( 0th 1st 2nd 3rd 4th )
ARRAY+=( "5th" )
printVar ARRAY

echo "---- compact ----"
ARRAY=( 0th 1st [3]="3rd" 4th )
ARRAY=( "${ARRAY[@]}" )
printVar ARRAY

echo "---- slice ----"
ARRAY=( 0th 1st 2nd 3rd 4th )
quoteln "${ARRAY[@]:1:3}"

echo "---- concat ----"
FOO=( 0th 1st 2nd 3rd 4th )
BAR=( 5th 6th )
ARRAY=( "${FOO[@]}" "${BAR[@]}" )
printVar ARRAY

echo "---- get last value ----"
ARRAY=( 0th 1st [3]=3rd 4th )
quoteln ${ARRAY[@]: -1}

echo "---- get last index ----"
ARRAY=( 0th 1st [3]=3rd 4th )
INDICES=( "${!ARRAY[@]}" )
quoteln ${INDICES[@]: -1}
