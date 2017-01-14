Beeline packaged in a docker container
======================================

```
HIVE_VERSION=1.2.0
docker run --rm -ti --entrypoint=./beeline.sh sutoiku/beeline:hive-$HIVE_VERSION -u jdbc:hive2://localhost:10000/default
```

The default hive version is 1.2.0 to be compatible with HDP-2.4 and up.
It also works for homebrew's 2.1.0 (Jan 2017)

For hive-1.2.0, we are using a patched version of beeline where the fix HIVE-7224 is applied (--incremental=true by default)
and added an option --fetchSize to controle the size of the fetches).

Example:
========
Extract some data as csv:

```
./beeline.sh -u jdbc:hive2://localhost:10000/default --outputformat=csv2 --showHeader=true --color=false \
	--fetchSize=100000 \
	-e 'select * from u_data limit 10;' > theFileWhereToStoreTheData.csv
```

Full documentation: https://cwiki.apache.org/confluence/display/Hive/HiveServer2+Clients#HiveServer2Clients-Beeline–CommandLineShell

Note
====

If beeline cannot connect with the following error:
```
➜ HIVE_VERSION=2.1.1 ./beeline.sh -u jdbc:hive2://localhost:10000/default
Connecting to jdbc:hive2://localhost:10000/default
17/01/11 11:13:12 [main]: ERROR jdbc.HiveConnection: Error opening session
org.apache.thrift.TApplicationException: Required field 'client_protocol' is unset! Struct:TOpenSessionReq(client_protocol:null, configuration:{use:database=default})
	at org.apache.thrift.TApplicationException.read(TApplicationException.java:111) ~[hive-jdbc-2.1.1-standalone.jar:2.1.1]
```

Then the version of hive-jdbc in use does not match the version in the Hive cluster.
Client using an older version of hive libraries seem to be comptible with newer servers.
The opposite is not true.

For example, HDP-2.4 and HDP-2.5 are using hive-1.2.1; Homebrew is using hive-2.1.0; CDH-5.5 and up are using hive-1.1.0

License
=======
The dockerfile and beeline startup script are public domain.

The libraries packaged in the docker image are under their respective original copyright and license.

The java libraries are all downloaded from maven central and identical to the ones found in an Apache Licensed Hadoop distribution.
