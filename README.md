Beeline packaged in a docker container
======================================

```
docker run --rm -ti --entrypoint=./beeline.sh sutoiku/beeline -u jdbc:hive2://localhost:10000/default
```

https://cwiki.apache.org/confluence/display/Hive/HiveServer2+Clients#HiveServer2Clients-Beeline–CommandLineShell

License
=======
The dockerfile and beeline startup script are public domain.

The libraries packaged in the docker image are under their respective original copyright and license.
The java libraries are all downloaded from maven central and identical to the ones found in an Apache Licensed Hadoop distribution.
