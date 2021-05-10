#!/bin/dash
# Test that all commits appear in repository

# Execute commands
./girt-init >> /dev/null
touch a b
./girt-add a b
./girt-commit -m "First commit" >> /dev/null
echo "This is a line" > a
./girt-add a
./girt-commit -m "Second commit" >> /dev/null

count=0
correct=0
for commit in `ls -d ./.girt/.commit.*`; do
    count=$((count+1))
    # We can only have two commits, so the commit should be either of these two paths
    if [ $commit = "./.girt/.commit.0" ] || [ $commit = "./.girt/.commit.1" ]; then
        continue
    else
        # If somehow not, incorrect and break
        correct=1
        break
    fi
done

if [ $count -eq 2 ] && [ $correct -eq 0 ]; then
    # Nothing is wrong and we count two commits in the repository
    echo "Passes test"
    rm -rf "./.girt"
    rm a
    rm b
else
    echo "Fails test"
    rm -rf "./.girt"
    rm a
    rm b
fi
