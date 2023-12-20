ARG SO
ARG SO_VER
ARG DEBIAN_FRONTEND=noninteractive

FROM ${SO}:${SO_VER}
# FROM ubuntu:18.04
# FROM ubuntu:18.04 AS builder

RUN apt-get update -y
RUN apt-get install -y screen wget nano git htop curl unzip

RUN apt-get update
RUN apt-get install -y transmission-cli transmission-common transmission-daemon

WORKDIR /
COPY run.sh /run.sh

WORKDIR /
CMD ["sh","run.sh"]