#!/bin/bash

# updates go to the latest version if the current version is not the latest

source $SCRIPT_DIR/lib/_print-lib.sh

VERSION_REGEX='go[0-9\.]+'

sudo echo "checking for new go version.."
current_version=$(go version | grep -oP $VERSION_REGEX)
latest_version=$(curl -s https://go.dev/dl/?mode=json | jq -r '.[0].version')

colored_cversion=$(printColored purple $current_version)
if [ "$current_version" != "$latest_version" ]; then
	colored_lversion=$(printColored purple $latest_version)
	echo "new version found! upgrading from $colored_cversion to $colored_lversion.."
	$SCRIPT_DIR/util/go-install-version.sh $latest_version
else
	echo "go version $colored_cversion is already the latest version"
fi
