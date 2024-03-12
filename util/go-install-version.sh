#/bin/bash

source $SCRIPT_DIR/lib/_print-lib.sh

set -euf -o pipefail

VERSION_REGEX='go[0-9\.]+'

print() {
	echo "usage: <version>"
}

alias() {
	echo "go-install"
}

if [ $# -ne 1 ] || [ "$1" == "print" ]; then
	print
	exit 1
elif [ "$1" == "alias" ]; then
	alias
	exit 1
fi

VERSION=$1
VERSION_FILE=$VERSION.linux-amd64.tar.gz
DOWNLOAD_ADDR=https://go.dev/dl/

if [[ "$VERSION" =~ $VERSION_REGEX ]]; then
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
else
	echo "entered version is not a go version"
	exit 1
fi
