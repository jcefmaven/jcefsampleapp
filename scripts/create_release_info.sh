#!/bin/bash

if [ ! $# -eq 4 ]
  then
    echo "Usage: ./create_release_info.sh <build_meta> <actionsurl> <actionsrunnumber> <mvn_version>"
    echo ""
    echo "build_meta: the url to fetch the build meta from"
    echo "actionsurl: the url pointing to the builder job"
    echo "actionsrunnumber: the number of the current build"
    echo "mvn_version: the version of the jcefmaven artifacts"
    exit 1
fi

#CD to script dir
cd "$( dirname "$0" )"

#Set build info
. set_build_info.sh $1
export mvn_version=$4

#Create release_info dir and cd to it
cd ..
rm -r -f release_info
mkdir release_info
cd release_info

#Build final release information
#Tag
echo "release_tag_name=$mvn_version" >> $GITHUB_ENV

#Name
echo "release_name=JCefSampleApp for $mvn_version" >> $GITHUB_ENV 

#Readme
(
  echo "**Update JCEF to [$jcef_commit]($jcef_url)**"
  echo ""
  echo "Build: [GitHub Actions #$3]($2)"
  echo "JCEF maven version: $mvn_version"
  echo ""
  echo "**Test the resulting build on your platform:**"
  echo "\`\`\`"
  echo "java -jar jcefsampleapp-$mvn_version-jar-with-dependencies.jar"
  echo "\`\`\`"
  echo "Make sure to include the required module opens when running on JDK 16 or later. You can find them [here](https://github.com/jcefmaven/jcefmaven#limitations)."
  echo ""
  echo "**Warning:** This will destroy any directory called \`jcef-bundle\` in your current work dir!"
) > release_message.md

#Add build_meta.json
curl -s -L -o build_meta.json $1

#Cleanup
cd ..
