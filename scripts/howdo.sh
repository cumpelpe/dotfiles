#!/usr/bin/env bash

TMPFILE=$(mktemp)
howdoi $1 -a | fold -s -w121 | pygmentize -f bmp -P 'style=inkpot' -g > $TMPFILE ; feh $TMPFILE --class='floating'
