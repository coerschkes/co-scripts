#!/bin/bash

MAX_LEN=0
SPACING=""
BASE_NAME=""

setBaseName() {
	if [ "$#" -ne 1 ]; then
		echo 'error: getBaseName() invalid number of args. need [1] got [{$#}]'
		exit 1
	fi
	ext=${1##*.}
	BASE_NAME=$(basename $1 .$ext)
}

calculateSpacing() {
	spacingLen=$(expr $MAX_LEN - ${#BASE_NAME})
	SPACING="  "
	for ((i = 0; i < $spacingLen; i++)); do
		SPACING=$SPACING" "
	done
}

calculateMaxLen() {
	for file in $FOLDER_PATH/*; do
		setBaseName $file
		if ((${#BASE_NAME} > $MAX_LEN)); then
			MAX_LEN=${#BASE_NAME}
		fi
	done
}

if [ "$#" -ne 1 ]; then
	echo 'usage: <path>'
	exit 1
fi

FOLDER_PATH=$1

echo "commands: $FOLDER_PATH"
echo ""
echo "{"

calculateMaxLen

for file in $FOLDER_PATH/*; do
	setBaseName $file
	calculateSpacing
	if [[ $BASE_NAME != _* ]]; then
		base=$(/home/coerschkes/scripts/print-colored.sh green $BASE_NAME)
		usage=$($file print)
		echo -e "$base$SPACING$usage"
	fi
done

echo "}"
echo ""
