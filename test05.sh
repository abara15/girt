#!/bin/dash
# Test that show is correct

# Execute commands
./girt-init >> /dev/null
echo "This is my initial line" > a.txt
./girt-add a.txt
./girt-commit -m "First commit" >> /dev/null
echo "This is the line under my initial line" >> a.txt
./girt-add a.txt
output_commit=$(./girt-show 0:a.txt)
output_directory=$(./girt-show :a.txt)

if [ "$output_commit" != "$output_directory" ]; then
    # The file in our first commit isn't the same as a.txt in the index directory, so it passes the test
    echo "Passes test"
    rm -rf "./.girt"
    rm "a.txt"
else
    echo "Fails test"
    rm -rf "./.girt"
    rm "a.txt"
fi
