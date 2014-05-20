FROM munkyboy/java:trusty_8

ENV ENV_ES_VERSION 1.0.1
ENV ENV_KAFKA_VERSION 0.8.1.1
ENV ENV_SCALA_VERSION 2.9.2
ENV ENV_LOGSTASH_VERSION 1.4.1

## Install joekiller/logstash-kafka
RUN wget -q -O - http://github.com/joekiller/logstash-kafka/archive/v0.5.0.tar.gz | tar -C /usr/local/ -xzf -

RUN sed -E -i "s|ELASTICSEARCH_VERSION=.*|ELASTICSEARCH_VERSION=$ENV_ES_VERSION|" /usr/local/logstash-kafka-0.5.0/Makefile
RUN sed -E -i "s|KAFKA_VERSION\?=.*|KAFKA_VERSION?=$ENV_KAFKA_VERSION|" /usr/local/logstash-kafka-0.5.0/Makefile
RUN sed -E -i "s|SCALA_VERSION\?=.*|SCALA_VERSION?=$ENV_SCALA_VERSION|" /usr/local/logstash-kafka-0.5.0/Makefile
RUN sed -E -i "s|LOGSTASH_VERSION\?=.*|LOGSTASH_VERSION?=$ENV_LOGSTASH_VERSION|" /usr/local/logstash-kafka-0.5.0/Makefile

RUN sudo apt-get install make
RUN sudo apt-get install rsync
RUN make -C "/usr/local/logstash-kafka-0.5.0/" tarball

ENTRYPOINT ["/usr/local/logstash-kafka-0.5.0/build/tarball/logstash-1.4.1/bin/logstash"]
CMD ["agent", "-e ''"]
