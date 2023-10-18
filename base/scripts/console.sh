#!/bin/bash

function print_usage() {
    echo "Usage: console.sh <cmd>"
    exit 1
}

function execute_cmd() {
    echo "$1" > "$DEFAULT_CONSOLE_STDIN_FILE"
    echo "Command send!"
}

CMD=$1

if [ -z "$CMD" ]; then
    print_usage
fi

if [ ! -f "$DEFAULT_CONSOLE_STDIN_FILE" ]; then
    echo "Can't find console stdin file!"
    exit 1
fi

execute_cmd "$CMD"