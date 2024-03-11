#!/bin/bash

INVISIBLE_SCRIPTS_PREFIX=_

print() {
	echo 'usage: <path>'
}

getBaseName() {
	if [ "$#" -ne 1 ]; then
		echo "error: getBaseName() invalid number of args. need [1] got [$#]"
		echo "usage: <path>"
		exit 1
	fi

	ext=${1##*.}
	echo $(basename $1 .$ext)
}

calculateSpacing() {
	if [ "$#" -ne 2 ]; then
		echo "error: calculateSpacing() invalid number of args. need [2] got [$#]"
		echo 'usage: <script_alias> <max_len>'
		exit 1
	fi

	script_alias=$1
	max_len=$2
	spacing_len=$(expr $max_len - ${#1})
	spacing="  "

	for ((i = 0; i < spacing_len; i++)); do
		spacing="$spacing "
	done

	echo "$spacing"
}

calculateAliasMaxLen() {
	if [ "$#" -ne 1 ]; then
		echo "error: calculateAliasMaxLen() invalid number of args. need [1] got [$#]"
		echo 'usage: <path>'
		exit 1
	fi

	folder_path=$1
	max_len=0

	for file in $folder_path/*; do
		base_name=$(getBaseName $file)
		if [[ $base_name != $INVISIBLE_SCRIPTS_PREFIX* ]]; then
			script_alias=$($file alias)
			if ((${#script_alias} > $max_len)); then
				max_len=${#script_alias}
			fi
		fi
	done

	echo $max_len
}

printScripts() {
	if [ "$#" -ne 1 ]; then
		echo "error: printScripts() invalid number of args. need [1] got [$#]"
		echo 'usage: <path>'
		exit 1
	fi

	script_path=$1
	max_len=$(calculateAliasMaxLen $script_path)

	echo "commands: $script_path"
	echo ""
	echo "{"

	for file in $script_path/*; do
		base_name=$(getBaseName $file)
		if [[ $base_name != $INVISIBLE_SCRIPTS_PREFIX* ]]; then
			script_alias=$($file alias)
			spacing="$(calculateSpacing $script_alias $max_len)"
			base=$($SCRIPT_DIR/print/_print-colored.sh green $script_alias)
			usage=$($file print)
			echo -e "$base$spacing$usage"
		fi
	done

	echo "}"
	echo ""
}

if [ "$#" -ne 1 ]; then
	print
	exit 1
fi

printScripts $1