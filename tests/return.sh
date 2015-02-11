#!/bin/bash

false; echo "false: $?"
true; echo "true: $?"

if false; then
    echo "false: true"
else
    echo "false: false"
fi

if true; then
    echo "true: true"
else
    echo "true: false"
fi

if ! true; then
    echo "! true: true"
else
    echo "! true: false"
fi

f() {
  return $1
}

if f 0; then
    echo "f 0: true"
else
    echo "f 0: false"
fi

if f 1; then
    echo "f 1: true"
else
    echo "f 1: false"
fi
