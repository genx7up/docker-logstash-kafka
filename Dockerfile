FROM nclans/centos:latest

#Install JAVA from Oracle

ENV ENV_ES_VERSION 1.3.4
ENV ENV_KAFKA_VERSION 0.8.1.1
ENV ENV_SCALA_VERSION 2.9.2
ENV ENV_LOGSTASH_VERSION 1.4.2

RUN yum -y install wget rsync make

## Install joekiller/logstash-kafka
RUN wget -q -O - http://github.com/joekiller/logstash-kafka/archive/v0.6.2.tar.gz | tar -C /usr/local/ -xzf -

RUN sed -E -i "s|ELASTICSEARCH_VERSION=.*|ELASTICSEARCH_VERSION=$ENV_ES_VERSION|" /usr/local/logstash-kafka-0.6.2/Makefile
RUN sed -E -i "s|KAFKA_VERSION\?=.*|KAFKA_VERSION?=$ENV_KAFKA_VERSION|" /usr/local/logstash-kafka-0.6.2/Makefile
RUN sed -E -i "s|SCALA_VERSION\?=.*|SCALA_VERSION?=$ENV_SCALA_VERSION|" /usr/local/logstash-kafka-0.6.2/Makefile
RUN sed -E -i "s|LOGSTASH_VERSION\?=.*|LOGSTASH_VERSION?=$ENV_LOGSTASH_VERSION|" /usr/local/logstash-kafka-0.6.2/Makefile

RUN make -C "/usr/local/logstash-kafka-0.6.2/" tarball

# Define default run command.
WORKDIR /opt
ADD run.sh /run.sh
CMD ["bash", "/run.sh"]
