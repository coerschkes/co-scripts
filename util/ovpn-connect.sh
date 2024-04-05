#!/bin/bash

description() {
	echo "connect to a vpn with a ovpn file"
}

print() {
	echo "usage: <ovpn file>"
}

alias() {
	echo "ovpn-connect"
}

main() {
	sudo openvpn "$@"
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
		main "$@"
		;;
	esac
else
	print
fi
exit 1
