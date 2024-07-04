#!/bin/bash

description() {
	echo "change the icon for virtualbox back after an update"
}

print() {
	echo "usage: <>"
}

alias() {
	echo "vbox-icon-refresh"
}

main() {
	sudo sed -i 's@Icon=.*@Icon=/usr/share/applications/virtualbox.png@' /usr/share/applications/virtualbox.desktop
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
