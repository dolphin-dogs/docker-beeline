#!/bin/sh

# Example: ./beeline.sh -u jdbc:hive2://localhost:10000/default
[ -z "$HIVE_VERSION" ] && [ -f "lib/hive.version" ] && HIVE_VERSION="$(cat lib/hive.version)"
[ -z "$HIVE_VERSION" ] && HIVE_VERSION=1.2.0 # HDP is at 1.2.0. 1.2.0 looks compatible with 2.1.0 (which is the homebrew version in Jan 2017)
export HIVE_VERSION="$HIVE_VERSION"
[ ! -f "lib/hive.version" ] || [ "$(cat lib/hive.version)" != "$HIVE_VERSION" ] && sh lib/download.sh

CLASSPATH=$(JARS=(lib/*.jar); IFS=:; echo "${JARS[*]}")
echo "Starting beeline for $(cat lib/hive.version)" >&2
echo "CLASSPATH $CLASSPATH" >&2
java -Dlog4j.configurationFile=conf/log4j2.properties -cp $CLASSPATH org.apache.hive.beeline.BeeLine "$@"
