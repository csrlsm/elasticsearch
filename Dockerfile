FROM docker.elastic.co/elasticsearch/elasticsearch:7.12.0
MAINTAINER csrlsm

RUN  echo "*		hard    nofile		65535" > /etc/security/limit.conf \
  && echo "*		soft    nofile    65535" >> /etc/security/limit.conf \
  && echo "*		hard    memlock		65535" >> /etc/security/limit.conf \
  && echo "*		soft    memlock		65535" >> /etc/security/limit.conf
RUN yum -y install wget zip telnet curl
RUN wget -P /tmp/ https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.12.0/elasticsearch-analysis-ik-7.12.0.zip
RUN mkdir /usr/share/elasticsearch/plugins/ik && cd /usr/share/elasticsearch/plugins/ik && unzip /tmp/elasticsearch-analysis-ik-7.12.0.zip && rm -rf /tmp/elasticsearch-analysis-ik-7.12.0.zip \
    && chown -R elasticsearch:root /usr/share/elasticsearch/plugins/*
    
RUN rm -f /etc/localtime \
    && ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone    
