#!/bin/bash

INVISIBLE_SCRIPTS_PREFIX=_
source $SCRIPT_DIR/print/_print-colored-lib.sh

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

getBaseName() {
	if [ "$#" -ne 1 ]; then
		echo "error: getBaseName() invalid number of args. need [1] got [$#]"
		echo "usage: <path>"
		exit 1
	fi

	ext=$(getExt $1)
	echo $(basename $1 .$ext)
}

getExt() {
	if [ "$#" -ne 1 ]; then
		echo "error: getExt() invalid number of args. need [1] got [$#]"
		echo "usage: <path>"
		exit 1
	fi

	echo ${1##*.}
}

addAliasesForPath() {
	if [ "$#" -ne 1 ]; then
		echo "error: addAliasesForPath() invalid number of args. need [1] got [$#]"
		echo 'usage: <path>'
		exit 1
	fi

	folder_path=$1

	for file in $folder_path/*; do
		if [[ -f $file ]] && [[ $(getExt $file) == "sh" ]]; then
			base_name=$(getBaseName $file)
			if [[ $base_name != $INVISIBLE_SCRIPTS_PREFIX* ]]; then
				script_alias=$($file alias)
				addAlias $script_alias $file
			fi
		fi
	done
}

addAliasesForPath $1
