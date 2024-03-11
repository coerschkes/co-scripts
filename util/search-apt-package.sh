#!/bin/bash

print() {
        echo "usage: <search-string>"
}

alias() {
        echo "search-apt"
}

if [ $# -ne 1 ] || [ "$1" == "print" ]; then
        print
        exit 1
elif [ "$1" == "alias" ]; then
        alias
        exit 1
fi

apt-cache search --names-only '^'$1'*'
