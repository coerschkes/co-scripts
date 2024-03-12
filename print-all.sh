#!/bin/bash

description() {
	echo "prints out all scripts in the specified folders"
}

print() {
	echo ""
}

alias() {
	echo "ps"
}

main() {
	print_script=$SCRIPT_DIR/print/_print-scripts.sh
	$print_script "$SCRIPT_DIR"
	$print_script "$SCRIPT_DIR/util"
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
