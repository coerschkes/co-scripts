#!/bin/bash

print() {
	echo "usage: <src> <dest>"
}

alias() {
	echo "create-smlink"
}

if [ "$#" -eq 1 ]; then
	if [ "$1" == "print" ]; then
		print
	elif [ "$1" == "alias" ]; then
		alias
	else
		print
	fi
	exit 1
fi

if [ "$#" -ne 2 ]; then
	print
	exit 1
fi

ln -s $1 $2
