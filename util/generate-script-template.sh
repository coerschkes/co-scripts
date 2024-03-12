#/bin/bash

description() {
    echo "generates a new script from _template.sh in $SCRIPT_DIR"
}

print() {
    echo "usage: <name>"
}

alias() {
    echo "new-script"
}

main() {
    if [ "$#" -ne 1 ]; then
        print
        exit 1
    fi

    cp $SCRIPT_DIR/util/_template.sh $SCRIPT_DIR/$1.sh
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
