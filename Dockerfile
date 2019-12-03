FROM 172.16.4.20/third/centos:7.6.1810

LABEL mainitaiainer kang.qin

#安装基础工具包
RUN yum install -y curl java-1.8.0-openjdk vim net-tools telnet wget maven libtool-ltdl-devel

#cp 本机的docker命令与kubectl命令
COPY kubectl /usr/bin/kubectl
COPY docker /usr/bin/docker

RUN mkdir -p /var/run
RUN mkdir -p /root/.kube/
COPY config /root/.kube/config

#安装jenkins-slave
RUN mkdir -p /usr/share/jenkins
COPY slave.jar /usr/share/jenkins/slave.jar
COPY jenkins-agent  /usr/bin/jenkins-agent 
RUN chmod +x /usr/bin/jenkins-agent 

ENTRYPOINT ["jenkins-agent"]

