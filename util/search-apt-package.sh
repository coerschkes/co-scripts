#!/bin/bash

description() {
        echo "searches for an apt package with the given name"
}

print() {
        echo "usage: <search-string>"
}

alias() {
        echo "search-apt"
}

main() {
        apt-cache search --names-only '^'$1'*'
        exit
}

if [ "$#" -eq 1 ]; then
        case $1 in
        "print")
                print
                ;;
        "alias")
                alias
                ;;
        "description")
                description
                ;;
        *)
                main "$@"
                ;;
        esac
else
        print
fi
exit 1
