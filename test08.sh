#!/bin/dash
# Tests that girt-rm --cached removes from index only

# Execute command
./girt-init >> /dev/null
touch a b
./girt-add a b
./girt-rm --cached a

if [ -e "./.girt/index/a" ] && [ -e "a" ]; then
    # Fails since it is still in the index and current directory
    echo "Failed test"
    rm -rf "./.girt"
    rm a
    rm b
    exit 1
elif [ -e "./.girt/index/a" ]; then
    # Fails since it is still in the index
    echo "Failed test"
    rm -rf "./.girt"
    rm a
    rm b
    exit 1
elif [ ! -e "a" ]; then
    # Fails since it was deleted from the current directory
    echo "Failed test"
    rm -rf "./.girt"
    rm b
    exit 1
elif [ ! -e "./.girt/index/a" ]; then
    # Passes since it was deleted from the index
    echo "Passed test"
    rm -rf "./.girt"
    rm a
    rm b
    exit 0
fi
