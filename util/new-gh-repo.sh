#!/bin/bash

description() {
	echo "creates a default public repository on github"
}

print() {
	echo "usage: <repository-name>"
}

alias() {
	echo "new-gh-repo"
}

main() {
	gh repo create $1 --public
	git remote add origin git@github.com:coerschkes/$1.git
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
