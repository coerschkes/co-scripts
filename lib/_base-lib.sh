#!/bin/bash

INVISIBLE_SCRIPTS_PREFIX=_

isDirectory() {
	if [ "$#" -ne 1 ]; then
		echo "error: isDirectory() invalid number of args. need [1] got [$#]"
		echo "usage: <path>"
		exit 1
	fi

	if [ -d $1 ]; then
		echo "true"
	else
		echo "false"
	fi
}

isFile() {
	if [ "$#" -ne 1 ]; then
		echo "error: isFile() invalid number of args. need [1] got [$#]"
		echo "usage: <path>"
		exit 1
	fi

	if [ -f $1 ]; then
		echo "true"
	else
		echo "false"
	fi
}

isSymlink() {
	if [ "$#" -ne 1 ]; then
		echo "error: isSymlink() invalid number of args. need [1] got [$#]"
		echo "usage: <path>"
		exit 1
	fi

	if [ -L $1 ]; then
		echo "true"
	else
		echo "false"
	fi
}

isExecutable() {
	if [ "$#" -ne 1 ]; then
		echo "error: isExecutable() invalid number of args. need [1] got [$#]"
		echo "usage: <path>"
		exit 1
	fi

	if [ -x $1 ]; then
		echo "true"
	else
		echo "false"
	fi
}

isReadable() {
	if [ "$#" -ne 1 ]; then
		echo "error: isReadable() invalid number of args. need [1] got [$#]"
		echo "usage: <path>"
		exit 1
	fi

	if [ -r $1 ]; then
		echo "true"
	else
		echo "false"
	fi
}

isWritable() {
	if [ "$#" -ne 1 ]; then
		echo "error: isWritable() invalid number of args. need [1] got [$#]"
		echo "usage: <path>"
		exit 1
	fi

	if [ -w $1 ]; then
		echo "true"
	else
		echo "false"
	fi
}

getExt() {
	if [ "$#" -ne 1 ]; then
		echo "error: getExt() invalid number of args. need [1] got [$#]"
		echo "usage: <path>"
		exit 1
	fi

	echo ${1##*.}
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
