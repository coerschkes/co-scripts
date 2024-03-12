#!/bin/bash

description() {
	echo "remove all bash_aliases and add them again to detect changes"
}

print() {
	echo ""
}

alias() {
	echo "is"
}

main() {
	if [ $# -ne 0 ]; then
		echo "no argument expected"
		exit 1
	fi

	rm -f ~/.bash_aliases && touch ~/.bash_aliases

	import_script=$SCRIPT_DIR/util/_import-scripts.sh
	$import_script "$SCRIPT_DIR"
	$import_script "$SCRIPT_DIR/util"
	$import_script "$SCRIPT_DIR/print"
	exit
}

if [ "$#" -eq 1 ]; then
	case $1 in
	"print")
		print
		;;
	"alias")
		alias
		;;
	"description")
		description
		;;
	*)
		echo "unknown argument $1"
		;;
	esac
	exit 1
fi

main "$@"
