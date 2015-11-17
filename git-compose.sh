#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    repo=$(echo $line | cut -d":" -f1)
    ref=$(echo $line | cut -d":" -f2)
    name=$(echo $line | cut -d":" -f3)
    command=$(echo $line | cut -d":" -f4)

    if [ ! -d "$name" ]; then
        echo "$name doesn't exists, will fork";

        git clone "https://github.com/$repo" "$name" -b $ref
    else
        echo "$name exists, updating to origin/$ref"

        cd $name && git fetch && git checkout origin/$ref
    fi

    if [ ${#command} -gt 0 ]; then
        echo "running $command"
        $command
    fi
done < "$1"
