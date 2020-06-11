#!/bin/bash

TOMCAT_BIN="/home/ubuntu/server/apache-tomcat-9.0.36/bin"
TOMCAT_HOME="/home/ubuntu/server/apache-tomcat-9.0.36/webapps"
CURRENT=$PWD
cd $TOMCAT_BIN
sh shutdown.sh

cd $CURRENT
rm -rf ../../build
cd ../../
gradle build

cd docs/database/script/
mysql -u root -p -e "source portfoli-ddl.sql"
mysql -u root -p -e "source portfoli-dml.sql"

rm $TOMCAT_HOME/portfoli.war
rm -rf $TOMCAT_HOME/portfoli
cp ../../../build/libs/portfoli.war $TOMCAT_HOME/

cd $TOMCAT_BIN
sh startup.sh

