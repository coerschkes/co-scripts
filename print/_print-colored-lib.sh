#!/bin/bash

BLACK="0;30"
RED="0;31"
GREEN="0;32"
ORANGE="0;33"
BLUE="0;34"
PURPLE="0;35"
CYAN="0;36"
LIGHT_GRAY="0;37"
DARK_GRAY="1;30"
LIGHT_RED="1;31"
LIGHT_GREEN="1;32"
YELLOW="1;33"
LIGHT_BLUE="1;34"
LIGHT_PURPLE="1;35"
LIGHT_CYAN="1;36"
WHITE="1;37"
NC="0"

printAvailableColors(){
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
}

setColorCode(){
        if [ "$#" -ne 1 ]; then
                echo "error: setColorCode() invalid number of args. need [1](<color>) got [$#]"
		exit
        fi
        case "$1" in
                "black")
                        COLOR_CODE=$BLACK
                        ;;
                "red")
                        COLOR_CODE=$RED
                        ;;
                "green")
                        COLOR_CODE=$GREEN
                        ;;
                "orange")
                        COLOR_CODE=$ORANGE
                        ;;
                "blue")
                        COLOR_CODE=$BLUE
                        ;;
                "purple")
                        COLOR_CODE=$PURPLE
                        ;;
                "cyan")
                        COLOR_CODE=$CYAN
                        ;;
                "light-gray")
                        COLOR_CODE=$LIGHT_GRAY
                        ;;
                "dark-gray")
                        COLOR_CODE=$DARK_GRAY
                        ;;
                "light-red")
                        COLOR_CODE=$LIGHT_RED
                        ;;
                "light-green")
                        COLOR_CODE=$LIGHT_GREEN
                        ;;
                "yellow")
                        COLOR_CODE=$YELLOW
                        ;;
                "light-blue")
                        COLOR_CODE=$LIGHT_BLUE
                        ;;
                "light-purple")
                        COLOR_CODE=$LIGHT_PURPLE
                        ;;
                "light-cyan")
                        COLOR_CODE=$LIGHT_CYAN
                        ;;
                "white")
                        COLOR_CODE=$WHITE
                        ;;
                *)
                        echo "color '$1' not recognized"
                        exit
                        ;;
        esac
}

printColored() {
        if [ "$#" -lt 2 ]; then
                echo "error: printColored() invalid number of args. need at least two(<color> <text>) got [$#]"
                exit
        fi
	text=""
	isColorCode=true
	for var in "$@"; do
		if $isColorCode; then
			setColorCode $var
			isColorCode=false
			continue
		fi
		text=$text$var
	done
        echo -e "\033[${COLOR_CODE}m${text}\033[${NC}m"
}
