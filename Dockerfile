FROM java:8-jre

MAINTAINER hugues@sutoiku.com

COPY . /apps/beeline

ENV HIVE_VERSION 1.2.0

WORKDIR /apps/beeline

RUN sh lib/download.sh

ENTRYPOINT /apps/beeline/beeline.sh
