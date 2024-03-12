#!/bin/bash

description() {
	echo "updates all dependencies specified"
}

print() {
	echo ""
}

alias() {
	echo "update"
}

update_js_libs() {
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This load>

	# Load Angular CLI autocompletion.
	source <(ng completion script)

	nvm install node
	nvm install-latest-npm
	npm install -g @angular/cli
}

main() {
	if [ $# -ne 0 ]; then
		echo "no argument expected"
		exit 1
	fi

	sudo apt update &&
		sudo apt upgrade -y &&
		sudo apt autoremove -y &&
		sudo snap refresh &&
		sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh) &&
		$SCRIPT_DIR/util/_update-go.sh &&
		update_js_libs
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
