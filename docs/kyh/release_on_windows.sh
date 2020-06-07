#!/bin/bash

TOMCAT_HOME="/c/Users/kyh/apache-tomcat-9.0.34"
CURRENT=$PWD
cd $TOMCAT_HOME/bin/
./shutdown.bat

cd $CURRENT
rm -rf ../../build
cd ../../
gradle build

cd docs/database/script/
winpty mysql -u root -p -h 127.0.0.1  -e "source portfoli-ddl.sql"
winpty mysql -u root -p -h 127.0.0.1  -e "source portfoli-dml.sql"

rm $TOMCAT_HOME/webapps/portfoli.war
rm -rf $TOMCAT_HOME/webapps/portfoli
cp ../../../build/libs/portfoli.war $TOMCAT_HOME/webapps/

cd $TOMCAT_HOME/bin
./startup.bat

