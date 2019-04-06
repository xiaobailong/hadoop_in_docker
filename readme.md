# 使用方法
前提声明，本文假设用户已经有了一定的docker、docker-compose、kubernetes操作经验，并且用户已经有了docker环境或者kubernetes集群环境

首先执行以下命令下载本项目代码

`git clone https://github.com/xiaobailong/hadoop_in_docker.git`

## 单机版

### 启动

进入docker-compose目录,使用以下命令启动集群

`启动hdfs：

docker-compose -f docker-compose-hdfs.yml up -d

启动yarn集群：

docker-compose -f docker-compose-yarn.yml up -d`

### 关闭

在docker-compose目录中使用以下命令关闭集群

`关闭yarn集群：

docker-compose -f docker-compose-yarn.yml down

关闭hdfs集群：

docker-compose -f docker-compose-hdfs.yml down`

## kubernetes集群版

### 创建命名空间

kubectl create namespace xiaobailong

### 启动

进入kubernetes的相应子目录中使用以下命令启动集群

`进入kubernetes\hdfs目录下，执行以下命令启动hdfs：

kubectl create -f .

进入kubernetes\yarn目录下，执行以下命令启动yarn集群：

kubectl create -f .`

### 关闭

在kubernetes的相应子目录中使用以下命令关闭集群

`进入kubernetes\yarn目录下，执行以下命令关闭yarn集群：

kubectl delete -f .

进入kubernetes\hdfs目录下，执行以下命令关闭hdfs集群：

kubectl delete -f .`