#!/bin/dash
# Tests all Subset 0 commands for usage errors

# Execute command
init_usage=$(./girt-init 5)
init_msg="usage: girt-init"
./girt-init >> /dev/null

add_usage=$(./girt-add)
add_msg="usage: girt-add <filenames>"

commit_usage1=$(./girt-commit -g "test")
commit_usage2=$(./girt-commit -m -a "test")
commit_usage3=$(./girt-commit -a -g "test")
commit_usage4=$(./girt-commit -a -g "test" a)
commit_usage5=$(./girt-commit)
commit_msg="usage: girt-commit [-a] -m commit-message"

log_usage=$(./girt-log t)
log_msg="usage: girt-log"

show_usage1=$(./girt-show)
touch a b
./girt-commit -m "Test" >> /dev/null
show_usage2=$(./girt-show 0:a t)
show_msg="usage: girt-show <commit>:<filename>"


if [ "$init_usage" = "$init_msg" ]; then
    # Init usage message correct
    if [ "$add_usage" = "$add_msg" ]; then
        # Add usage message correct
        if [ "$commit_usage1" = "$commit_msg" ] && [ "$commit_usage2" = "$commit_msg" ] && [ "$commit_usage3" = "$commit_msg" ] && [ "$commit_usage4" = "$commit_msg" ] && [ "$commit_usage5" = "$commit_msg" ]; then
            # Commit usage message correct
            if [ "$log_usage" = "$log_msg" ]; then
                # Log usage message correct
                if [ "$show_usage1" = "$show_msg" ] && [ "$show_usage2" = "$show_msg" ]; then
                    # Show usage message correct
                    echo "Passed test"
                    rm -rf "./.girt"
                    rm a
                    rm b
                    exit 1
                fi
            fi
        fi
    fi
else
    echo "Failed test"
    rm -rf "./.girt"
    exit 1
fi
