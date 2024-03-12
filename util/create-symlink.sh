#!/bin/bash

description() {
	echo "creates a symbolic link"
}

print() {
	echo "usage: <src> <dest>"
}

alias() {
	echo "create-symlink"
}

main() {
	if [ "$#" -ne 2 ]; then
		print
		exit 1
	fi

	ln -s "$@"
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
