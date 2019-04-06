#!/usr/bin/env bash

MIRROR_LIBRARY_SERVER_IP=$1
HADOOP_VERSION=3.0.3

docker build -t ${MIRROR_LIBRARY_SERVER_IP}/ones/hadoop-base:${HADOOP_VERSION} .
docker push ${MIRROR_LIBRARY_SERVER_IP}/ones/hadoop-base:${HADOOP_VERSION}