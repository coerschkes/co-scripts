#/bin/bash
if [ $# -ne 1 ]; then
    echo $0: usage: version
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
