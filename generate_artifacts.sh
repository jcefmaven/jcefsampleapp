#!/bin/bash

if [ ! $# -eq 1 ]
  then
    echo "Usage: ./generate_artifacts.sh <mvn_version>"
    echo ""
    echo "mvn_version: The maven version to build for"
    exit 1
fi

export MVN_VERSION=$1

#CD to main dir of this repository
cd "$( dirname "$0" )"

#Clean output dir
rm -rf out

#Run docker build
docker compose -f docker-compose.yml up
