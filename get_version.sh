#!/bin/bash

CHANGES=$({ git diff --cached --numstat; git diff --numstat; } | awk '{ a+=($1+$2) } END {print a}')

IS_INSIDE_REPO=$(git rev-parse --is-inside-work-tree)

if [ $IS_INSIDE_REPO == "true" ];
then
    printf $(git rev-parse --short=6 HEAD)"+"$CHANGES
else
    printf "000000"
fi
