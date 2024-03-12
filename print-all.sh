#!/bin/bash

# prints out all scripts in the specified folders

print() {
	echo ""
}

alias() {
	echo "ps"
}

if [ "$#" -eq 1 ]; then
	if [ "$1" == "print" ]; then
		print
	elif [ "$1" == "alias" ]; then
		alias
	fi
	exit 1
fi


print_script=$SCRIPT_DIR/print/_print-scripts.sh
$print_script "$SCRIPT_DIR"
$print_script "$SCRIPT_DIR/util"