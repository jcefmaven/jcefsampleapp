#!/bin/bash

if [ ! $# -eq 1 ]
  then
    echo "Usage: ./set_build_info.sh <build_meta_url>"
    echo ""
    echo "build_meta_url: The url to download build_meta.json from"
    exit 1
fi

#Print build meta location
echo "Initializing for build from $1..."

#Download build_meta.json and import to local environment
export $(curl -s -L $1 | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]")

#Set jcefmaven information
export tag_version=1.0

