#!/bin/bash

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

if [ $# -eq 1 ]; then
	if [ "$1" == "print" ]; then
		print
		exit 1
	elif [ "$1" == "alias" ]; then
		alias
		exit 1
	fi
fi

if [ $# -ne 0 ]; then
	print
	exit 1
fi

#update dependencies
sudo apt update &&
	sudo apt upgrade -y &&
	sudo apt autoremove -y &&
	#update snaps
	sudo snap refresh &&
	#update nordvpn
	sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh) &&
	#update js stuff
	update_js_libs
