#!/bin/bash

# Add aliases for all the scripts in the provided path

source $SCRIPT_DIR/lib/_base-lib.sh
source $SCRIPT_DIR/lib/_print-lib.sh

if [ "$#" -ne 1 ]; then
	print
	exit
fi

print() {
	echo "usage: <path>"
}

addAlias() {
	if [ "$#" -ne 2 ]; then
		echo "invalid number of arguments to add the alias. Need 2 got $#"
		exit
	fi

	alColored=$(printColored "purple" "$1")
	scriptColored=$(printColored "green" "$2")
	echo "alias $1=$2" >>~/.bash_aliases
	echo "alias $alColored added for script $scriptColored."
}

addAliasesForPath() {
	if [ "$#" -ne 1 ]; then
		echo "error: addAliasesForPath() invalid number of args. need [1] got [$#]"
		echo 'usage: <path>'
		exit 1
	fi

	if [ "$(isDirectory $1)" == "false" ]; then
		echo "error: addAliasesForPath() invalid path. need a directory got $1"
		exit 1
	fi

	folder_path=$1

	for file in $folder_path/*; do
		if [ "$(isFile $file)" == "true" ] && [ "$(isExecutable $file)" == "true" ]; then
			base_name=$(getBaseName $file)
			if [[ $base_name != $INVISIBLE_SCRIPTS_PREFIX* ]]; then
				script_alias=$($file alias)
				addAlias $script_alias $file
			fi
		fi
	done
}

addAliasesForPath $1
