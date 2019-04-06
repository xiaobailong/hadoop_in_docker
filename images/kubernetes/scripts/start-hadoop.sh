#!/usr/bin/env bash

#init dir
mkdir -p /data/hadoop/log

# create and format namenode if not exist
CLUSTER_ID=CID-c162a031-783e-4db8-823f-ab1ef43dbae8        # an unique cluster id for hadoop cluster
if [ ! -d /data/hadoop/dfs/namenode/data/current ]; then
  mkdir -p /data/hadoop/dfs/namenode/data
  chmod 700 /data/hadoop/dfs/namenode/data
  hdfs namenode -format -clusterId $CLUSTER_ID # always format with the same cluster id，use root user，before start HDFS，need to format NameNode
fi

# create datanode if not exist
if [ ! -d /data/hadoop/dfs/datanode/data/current ]; then
  mkdir -p /data/hadoop/dfs/datanode/data
  chmod 700 /data/hadoop/dfs/datanode/data
fi

#启动hadoop各组件服务
hdfs --daemon start namenode
#hdfs --daemon start datanode
#yarn resourcemanager
#yarn timelineserver
#yarn proxyserver
#yarn nodemanager
