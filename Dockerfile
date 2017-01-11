FROM java:8-jre

MAINTAINER hugues@sutoiku.com

COPY . /apps/beeline

RUN sh lib/download.sh

WORKDIR /apps/beeline

ENTRYPOINT /apps/beeline/beeline.sh
