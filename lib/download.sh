#!/bin/sh
echo "Downloading dependencies from maven central..."
cd lib
curl -LO http://central.maven.org/maven2/commons-cli/commons-cli/1.2/commons-cli-1.2.jar
curl -LO http://central.maven.org/maven2/org/apache/hadoop/hadoop-common/2.7.3/hadoop-common-2.7.3.jar
curl -LO http://central.maven.org/maven2/org/apache/hive/hive-beeline/2.1.1/hive-beeline-2.1.1.jar
curl -LO http://central.maven.org/maven2/jline/jline/2.12/jline-2.12.jar
curl -LO http://central.maven.org/maven2/net/sf/supercsv/super-csv/2.2.0/super-csv-2.2.0.jar
curl -LO http://central.maven.org/maven2/org/apache/hive/hive-jdbc/2.1.1/hive-jdbc-2.1.1-standalone.jar
cd ..
echo "Dependencies downloaded"