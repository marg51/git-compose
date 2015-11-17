#!/bin/bash

pwd=$(pwd)

while IFS='' read -r line || [[ -n "$line" ]]; do
    repo=$(echo $line | cut -d":" -f1)
    ref=$(echo $line | cut -d":" -f2)
    name=$(echo $line | cut -d":" -f3)
    command=$(echo $line | cut -d":" -f4-9)

    if [ ! -d "$name" ]; then
        echo "$name doesn't exist, will fork";

        git clone "https://github.com/$repo" "$name" -b $ref
    else
        echo "$name exists, updating to origin/$ref"

        cd "$name" && git fetch && git checkout origin/$ref
    fi

    if [ ${#command} -gt 0 ]; then
        echo "running $command"
        bash -c "$command"
    fi

    cd $pwd

done < "$1"
