#/bin/bash

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
VERSION_FILE=go$VERSION.linux-amd64.tar.gz
DOWNLOAD_ADDR=https://go.dev/dl/

sudo rm -rf /usr/local/go
wget $DOWNLOAD_ADDR$VERSION_FILE
sudo tar -C /usr/local -xzf $VERSION_FILE
rm $VERSION_FILE
go version
