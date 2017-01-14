#!/bin/sh
echo "Downloading dependencies from maven central for hive-$HIVE_VERSION..." >&2

cd lib
echo "$HIVE_VERSION" > hive.version
rm hive-beeline-*.jar hive-jdbc-*.jar

[ "$HIVE_VERSION" = "1.2.0" ] \
    && curl -LO https://s3.amazonaws.com/stoic-public/hive-beeline-1.2.0-fetchSize.jar \
    || curl -LO http://central.maven.org/maven2/org/apache/hive/hive-beeline/$HIVE_VERSION/hive-beeline-$HIVE_VERSION.jar
curl -LO http://central.maven.org/maven2/org/apache/hive/hive-jdbc/$HIVE_VERSION/hive-jdbc-$HIVE_VERSION-standalone.jar

[ ! -f commons-cli-1.2.jar ] && curl -LO http://central.maven.org/maven2/commons-cli/commons-cli/1.2/commons-cli-1.2.jar
[ ! -f hadoop-common-2.7.3.jar ] && curl -LO http://central.maven.org/maven2/org/apache/hadoop/hadoop-common/2.7.3/hadoop-common-2.7.3.jar
[ ! -f jline-2.12.jar ] && curl -LO http://central.maven.org/maven2/jline/jline/2.12/jline-2.12.jar
[ ! -f super-csv-2.2.0.jar ] && curl -LO http://central.maven.org/maven2/net/sf/supercsv/super-csv/2.2.0/super-csv-2.2.0.jar

cd ..
echo "Dependencies downloaded" >&2