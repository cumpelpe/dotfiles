#!/usr/bin/env bash

TMPFILE=$(mktemp)

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

$DIR/nic.sh "$TMPFILE" 

QUERY=$(cat $TMPFILE)


$DIR/howdo.sh "$QUERY"
