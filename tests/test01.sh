#!/bin/dash
# Test that girt-init fails to create a repository if one already exists

# Execute command
./girt-init >> /dev/null
output=$(./girt-init)

if [ "$output" = "./girt-init: error: .girt already exists" ]; then
    # 2nd repository failed to create, so passed test
    echo "Passed test"
    rm -rf "./.girt"
    exit 0
else
    echo "Failed test"
    rm -rf "./.girt"
    exit 1
fi
