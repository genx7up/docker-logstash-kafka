docker-logstash-kafka
=====================

Docker build for deploying joekiller/logstash-kafka variant of logstash.

## Run Commands:

```bash
## change 'base.conf' to be whatever your configurationf ile is.
docker run -d -t pcichonski/docker-logstash-kafka  agent -e "$(< base.conf)"
```
