#!/bin/sh

# Example: ./beeline.sh -u jdbc:hive2://localhost:10000/default
[ -z "$(ls lib/hive-beeline-*.jar)" ] && sh lib/download.sh

CLASSPATH=$(JARS=(lib/*.jar); IFS=:; echo "${JARS[*]}")
java -Dlog4j.configurationFile=conf/log4j2.properties -cp $CLASSPATH org.apache.hive.beeline.BeeLine "$@"
