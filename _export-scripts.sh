#!/bin/bash
#todo: register alias via script

# for entered path of script call get alias and add it to bash_aliases
source $SCRIPT_DIR/print/_print-colored-lib.sh

print() {
	echo "usage: <path>"
}

addAlias() {
	# check if alias is already present by checking "alias $1"
	if [ "$#" -ne 2 ]; then
		echo "invalid number of arguments to add the alias. Need 2 got $#"
		exit
	fi

	if grep -Fxq "$1" /home/coerschkes/.bash_aliases; then
		echo "alias $1 already registered, skipping.."
	else
		alColored=$(printColored "purple" "$1")
		scriptColored=$(printColored "green" "$2")
		#		echo "alias $1=$2" >> ~/.bash_aliases
		echo "alias $alColored added for script $scriptColored."
	fi
}

if [ "$#" -ne 1 ]; then
	print
	exit
fi

p=$1
al=$($SCRIPT_DIR/util/_get-alias.sh $p)
addAlias $al $p
