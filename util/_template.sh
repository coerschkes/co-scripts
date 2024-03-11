#!/bin/bash

print() {
	echo "usage: <usage>"
}

alias() {
	echo "alias"
}

if [ "$#" -eq 1 ]; then
	if [ "$1" == "print" ]; then
		print
	elif [ "$1" == "alias" ]; then
		alias
	fi
	exit 1
fi
