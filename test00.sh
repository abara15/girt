#!/bin/dash
# Test that girt-init creates a repository with an empty index directory and log file

# Execute command
./girt-init >> /dev/null

if [ -d "./.girt" ] && [ -d "./.girt/index" ] && [ -e "./.girt/log.txt" ]; then
    # Repository exists, index exists and log file exists
    echo "Passed test"
    rm -rf "./.girt"
    exit 0
else
    echo "Failed test"
    rm -rf "./.girt"
    exit 1
fi
