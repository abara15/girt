#!/bin/dash
# Test that girt-add fails to add a file which isn't in the current directory

# Execute command
./girt-init >> /dev/null
touch a b c
./girt-add a b c
output=$(./girt-add d)

if [ -d "./.girt" ]; then
    # Repository has been created
    if [ -e "./.girt/index/a" ] && [ -e "./.girt/index/b" ] && [ -e "./.girt/index/c" ]; then
        # Valid files added to index
        if [ "$output" = "./girt-add: error: can not open 'd'" ]; then
            echo "Passed test"
            rm -rf "./.girt"
            rm a
            rm b
            rm c
            exit 0
        else
            echo "Failed test"
            rm -rf "./.girt"
            rm a
            rm b
            rm c
            exit 1
        fi
    else
        echo "Failed test"
        rm -rf "./.girt"
        rm a
        rm b
        rm c
        exit 1
    fi
else
    echo "Failed test"
    rm -rf "./.girt"
    rm a
    rm b
    rm c
    exit 1
fi
