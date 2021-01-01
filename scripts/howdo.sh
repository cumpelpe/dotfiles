#!/usr/bin/env bash

TMPFILE=$(mktemp)
howdoi "$@" -a | fold -s -w121 | pygmentize -f bmp -P 'style=inkpot' -g > $TMPFILE ; feh $TMPFILE --class='floating'
