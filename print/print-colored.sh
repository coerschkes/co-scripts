#!/bin/bash

source $SCRIPT_DIR/print/_print-colored-lib.sh

if [[ "$#" -lt 2 ]]; then
        echo "exptected arg number is 2, got $#"
        echo "usage: <color> <text> <..>"
        printAvailableColors
        exit
fi


printColored "$@"
