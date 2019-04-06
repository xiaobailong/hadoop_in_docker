FROM xiaobailong/oracle-java:centos7_oracleJDK8

USER root
ENV HADOOP_VERSION 3.0.3
ENV CLUSTER_ID CID-c162a031-783e-4db8-823f-ab1ef43dbae8

# tools
RUN yum install -y net-tools iputils-ping iproute2 curl vim less

#java env
ENV PATH $PATH:$JAVA_HOME/bin
ENV CLASSPATH $JAVA_HOME/lib/tools.jar

#设置时间
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install hadoop，在http://mirror.bit.edu.cn/apache/hadoop/common/下载
RUN cd /opt && wget https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz && \
    tar -xvf hadoop-$HADOOP_VERSION.tar.gz && rm -rf hadoop-$HADOOP_VERSION.tar.gz && \
    ln -s /opt/hadoop-$HADOOP_VERSION /opt/current_hadoop && ldconfig

ENV HADOOP_HOME /opt/current_hadoop
ENV HADOOP_CONF_DIR /opt/current_hadoop/etc/hadoop
ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

# 修改hadoop的配置文件hadoop-env.sh和yarn-env.sh放在外部手动修改
# export JAVA_HOME=/usr/lib/jvm/default-jvm

# config hadoop
COPY conf/* $HADOOP_HOME/etc/hadoop/

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
