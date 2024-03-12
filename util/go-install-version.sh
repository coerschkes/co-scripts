#/bin/bash

source $SCRIPT_DIR/lib/_print-lib.sh

set -euf -o pipefail

VERSION_REGEX='go[0-9\.]+'
DOWNLOAD_ADDR=https://go.dev/dl/
VERSION_FILE_POSTFIX=.linux-amd64.tar.gz

description() {
	echo "installs a specific version of go"
}

print() {
	echo "usage: <version>"
}

alias() {
	echo "go-install"
}

main() {
	VERSION_FILE=$1$VERSION_FILE_POSTFIX

	if [[ "$1" =~ $VERSION_REGEX ]]; then
		vcolored=$(printColored purple $1)
		echo "now downloading version $vcolored.."
		wget --quiet --continue --show-progress "$DOWNLOAD_ADDR$VERSION_FILE"
		echo "removing old version.."
		sudo rm -rf /usr/local/go
		echo "installing new version.."
		sudo tar -C /usr/local -xzf $VERSION_FILE
		echo "installation complete! cleaning up.."
		rm $VERSION_FILE
		go version
		exit
	else
		echo "entered version is not a go version"
		exit 1
	fi
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
