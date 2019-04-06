FROM xiaobailong/hadoop_in_docker:base.3.0.3

#设置时间
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN yum makecache fast && yum install -y net-tools iputils-ping iproute2

# config hadoop
COPY ./conf/* $HADOOP_HOME/etc/hadoop/

# start hadoop
RUN mkdir /data/hadoop/dfs/namenode/{data,cache} -p && chmod -R 700 /data/hadoop/dfs/namenode && \
    mkdir -p /data/hadoop/dfs/datanode && chmod 700 /data/hadoop/dfs/datanode && \
    hdfs namenode -format -clusterId $CLUSTER_ID

#配置集群管理脚本
RUN mkdir -p /scripts && chmod 777 /var/log/yum.log
COPY ./scripts/* /scripts/
RUN chmod -R a+x /scripts

CMD /scripts/start-hadoop.sh && tail -f /var/log/yum.log
#EXPOSE 22 8030 8031 8032 8033 8040 8042 8088 8090 10033 10020 19888 19890 50010 50020 50070 50075 50090 49707
