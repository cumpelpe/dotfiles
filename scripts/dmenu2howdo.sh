#!/usr/bin/env bash
./howdo.sh "$(cat ~/.bash_history | dmenu -l 20)"
