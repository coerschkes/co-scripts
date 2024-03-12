#!/bin/bash

description() {
	echo "description"
}

print() {
	echo "usage: <>"
}

alias() {
	echo "alias"
}

main() {

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
		echo "unknown argument '$1'"
		;;
	esac
	exit 1
fi

main "$@"
