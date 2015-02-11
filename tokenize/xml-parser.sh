#!/bin/bash

rdom () {
    local IFS='<'
    read -d '>' TEXT ENTITY
}

while rdom; do
  printf "«%s»\n" "$ENTITY"
done  < simple.xml
