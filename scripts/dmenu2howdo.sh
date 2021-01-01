#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

$DIR/howdo.sh "$(cat ~/.bash_history | dmenu "$@" -l 20)" &
