#!/bin/bash

print() {
	echo "usage: <path>"
}

if [ "$#" -ne 1 ]; then 
	print
	exit
fi

source $1 alias
