#!/bin/bash
if [ $# -ne 1 ]; then
    echo $0: usage: search-string
    exit 1
fi

apt-cache search --names-only '^'$1'*'
