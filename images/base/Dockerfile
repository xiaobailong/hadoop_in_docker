FROM xiaobailong/oracle-java:centos7_oracleJDK8

USER root
ENV HADOOP_VERSION 3.0.3
ENV CLUSTER_ID CID-c162a031-783e-4db8-823f-ab1ef43dbae8

# tools
RUN yum makecache fast && yum install -y curl vim less

#java env
ENV PATH $PATH:$JAVA_HOME/bin
ENV CLASSPATH $JAVA_HOME/lib/tools.jar

# install hadoop，在http://mirror.bit.edu.cn/apache/hadoop/common/下载
RUN cd /opt && wget https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz && \
    tar -xvf hadoop-$HADOOP_VERSION.tar.gz && rm -rf hadoop-$HADOOP_VERSION.tar.gz && \
    ln -s /opt/hadoop-$HADOOP_VERSION /opt/current_hadoop && ldconfig

ENV HADOOP_HOME /opt/current_hadoop
ENV HADOOP_CONF_DIR /opt/current_hadoop/etc/hadoop
ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
