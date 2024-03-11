#/bin/bash

print() {
    echo "usage: <name>"
}


alias() {
    echo "new-script"
}

if [ $# -ne 1 ] || [ "$1" == "print" ]; then
        print
        exit 1
elif [ "$1" == "alias" ]; then
        alias
        exit 1
fi

cp $SCRIPT_DIR/util/_template.sh $SCRIPT_DIR/$1.sh
