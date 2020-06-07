#!/bin/bash

TOMCAT_BIN="/usr/share/tomcat9/bin"
TOMCAT_HOME="/var/lib/tomcat9/webapps"
CURRENT=$PWD
cd $TOMCAT_BIN
sh shutdown.sh

cd $CURRENT
rm -rf ../../build
cd ../../
gradle build

cd docs/database/script/
winpty mysql -u root -p -h 127.0.0.1  -e "source portfoli-ddl.sql"
winpty mysql -u root -p -h 127.0.0.1  -e "source portfoli-dml.sql"

rm $TOMCAT_HOME/portfoli.war
rm -rf $TOMCAT_HOME/portfoli
cp ../../../build/libs/portfoli.war $TOMCAT_HOME/

cd $TOMCAT_BIN
sh startup.sh

