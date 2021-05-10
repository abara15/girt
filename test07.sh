#!/bin/dash
# Tests girt-rm commands for usage errors

# Execute command
./girt-init >> /dev/null
touch a b
./girt-add a b
rm_usage1=$(./girt-rm)
rm_usage2=$(./girt-rm --test)
rm_msg="usage: girt-rm [--force] [--cached] <filenames>"

if [ "$rm_usage1" = "$rm_msg" ] && [ "$rm_usage2" = "$rm_msg" ]; then
    echo "Passed test"
    rm -rf "./.girt"
    rm a
    rm b
    exit 1
else
    echo "Failed test"
    rm -rf "./.girt"
    rm a
    rm b
    exit 1
fi
