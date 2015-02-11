#!/bin/bash

for x in PPID RANDOM PWD HOME HOSTNAME HOSTTYPE EUID GROUPS USER UID; do
  echo "$x:${!x}"
done | sort