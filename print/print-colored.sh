#!/bin/bash

source $SCRIPT_DIR/print/_print-colored-lib.sh

printAvailableColors(){
	echo "available colors"
	echo "{"
        printColored "black" "black"
        printColored "red" "red"
        printColored "green" "green"
        printColored "orange" "orange"
        printColored "blue" "blue"
        printColored "purple" "purple"
        printColored "cyan" "cyan"
        printColored "light-gray" "light-gray"
        printColored "dark-gray" "dark-gray"
        printColored "light-red" "light-red"
        printColored "light-green" "light-green"
        printColored "yellow" "yellow"
        printColored "light-blue" "light-blue"
        printColored "light-purple" "light-purple"
        printColored "light-cyan" "light-cyan"
        printColored "white" "white"
	echo "}"
}

if [[ "$#" -lt 2 ]]; then
        echo "exptected arg number is 2, got $#"
        echo "usage: <color> <text>"
        echo ""
	printAvailableColors
        exit 1
fi


printColored "$@"
