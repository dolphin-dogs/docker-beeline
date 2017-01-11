FROM java:8-jre

MAINTAINER hugues@sutoiku.com

COPY . /apps/beeline

ENV HIVE_VERSION 1.2.0

RUN sh lib/download.sh

WORKDIR /apps/beeline

ENTRYPOINT /apps/beeline/beeline.sh
