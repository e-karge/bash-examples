#!/bin/bash

# [ ... ] == test ...

VAR=set

check() {
  if (($?)); then
    echo false;
  else
    echo true;
  fi
}

printf '[ "" ]            -- %s\n' $([ "" ]; check)
printf '[ text ]          -- %s\n' $([ text ]; check)
printf '[ ${VAR+set} ]    -- %s\n' $([ ${VAR+set} ]; check)
printf '[ ${NOTSET+set} ] -- %s\n' $([ ${NOTSET+set} ]; check)
