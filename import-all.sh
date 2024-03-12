#!/bin/bash

# remove all bash_aliases and add them again to detect changes

print() {
	echo ""
}

alias() {
	echo "is"
}

if [ "$#" -eq 1 ]; then
	if [ "$1" == "print" ]; then
		print
	elif [ "$1" == "alias" ]; then
		alias
	fi
	exit 1
fi

rm -f ~/.bash_aliases && touch ~/.bash_aliases

import_script=$SCRIPT_DIR/util/_import-scripts.sh
$import_script "$SCRIPT_DIR"
$import_script "$SCRIPT_DIR/util"
$import_script "$SCRIPT_DIR/print"


