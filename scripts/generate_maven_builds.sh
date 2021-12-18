#!/bin/bash

if [ ! $# -eq 1 ]
  then
    echo "Usage: ./generate_maven_builds.sh <mvn_version>"
    echo ""
    echo "mvn_version: The maven version to build for"
    exit 1
fi

#CD to dir of this script
cd "$( dirname "$0" )"

#Set build info
export mvn_version=$1

#Clear export dir
rm -rf /jcefout/*

echo "Creating maven artifacts for $mvn_version..."

#jcefmaven
echo "###########################################"
echo "# Creating jcefsampleapp                  #"
echo "###########################################"
./generate_jcefsampleapp.sh

