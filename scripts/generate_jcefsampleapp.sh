#!/bin/bash

#CD to base dir of this repository
cd "$( dirname "$0" )" && cd ..

#Clear build dir
rm -rf build
mkdir build
cd build

echo "Creating jcefsampleapp with tag $mvn_version..."

#Copy project
cp -r ../src .

#Generate pom
./../scripts/fill_template.sh ../pom.xml pom.xml
./../scripts/fill_template.sh ../src/main/java/me/friwi/jcefsampleapp/TestReportGenerator.java src/main/java/me/friwi/jcefsampleapp/TestReportGenerator.java


#Perform build
mvn clean package

##########################
#Move built artifacts to export dir
##########################
echo "Exporting artifacts..."
mv target/jcefsampleapp-$mvn_version-jar-with-dependencies.jar /jcefout

#Done
echo "Done generating jcefsampleapp for $mvn_version"
