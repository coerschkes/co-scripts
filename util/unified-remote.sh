#!/bin/bash

description() {
	echo "starts unified remote server"
}

print() {
	echo "usage: <>"
}

alias() {
	echo "unified-remote"
}

main() {
 /home/coerschkes/dev/tools/unified_remote_server/urserver
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
