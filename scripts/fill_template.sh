#!/bin/bash

if [ ! $# -eq 2 ]
  then
    echo "Usage: ./fill_template.sh <template> <dest>"
    echo ""
    echo "template: the template file"
    echo "dest: the destination file"
    exit 1
fi

#Read file, replace and write to target
sed "s|{mvn_version}|$mvn_version|" $1 > $2
