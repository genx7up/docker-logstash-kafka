FROM munkyboy/java:quantal_7

ENV ENV_ES_VERSION 1.0.1
ENV ENV_KAFKA_VERSION 0.8.1.1
ENV ENV_SCALA_VERSION 2.9.2
ENV ENV_LOGSTASH_VERSION 1.4.1

## Install joekiller/logstash-kafka
RUN wget -q -O -  https://github.com/joekiller/logstash-kafka/archive/v0.5.0.tar.gz | tar -xvf -

RUN cd logstash-kafka-0.5.0

RUN sed -E -e -i ".bak" "s|ELASTICSEARCH_VERSION=.*|ELASTICSEARCH_VERSION=$ENV_ES_VERSION|" makefile
RUN sed -E -e -i ".bak" "s|KAFKA_VERSION=.*|KAFKA_VERSION=$ENV_KAFKA_VERSION|" makefile
RUN sed -E -e -i ".bak" "s|SCALA_VERSION=.*|SCALA_VERSION=$ENV_SCALA_VERSION|" makefile
RUN sed -E -e -i ".bak" "s|LOGSTASH_VERSION=.*|LOGSTASH_VERSION=$ENV_LOGSTASH_VERSION|" makefile

RUN make tarball
