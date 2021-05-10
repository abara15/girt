#!/bin/dash
# Test that log is correct

# Execute command
./girt-init >> /dev/null
touch a b c
./girt-add a b c
./girt-commit -m "First commit" >> /dev/null
touch d
./girt-add d
./girt-commit -m "Second commit" >> /dev/null
echo "1 Second commit" > "log_test.txt"
echo "0 First commit" >> "log_test.txt"

if cmp -s "log_test.txt" "./.girt/log.txt"; then
    # Repository has been created
    echo "Passed test"
    rm -rf "./.girt"
    rm a
    rm b
    rm c
    rm d
    rm "log_test.txt"
    exit 0
else
    echo "Failed test"
    rm -rf "./.girt"
    rm a
    rm b
    rm c
    rm d
    rm "log_test.txt"
    exit 1
fi
