docker-logstash-kafka
=====================

Docker build for deploying joekiller/logstash-kafka variant of logstash.

## Run Commands:

```bash
# WHERE:
## $PLUGIN_PATH - the absolute path of your host OS where your plugins are located (can be left off if not needed, just remove the --pluginpath arg)
## $CONFIG_FILE - the relative or absolute path to the config file you want to run logstash with.
docker run -d -t -v $PLUGIN_PATH:/var/local/plugins --name kafka_logstash paulcichonski/docker-logstash-kafka agent --pluginpath /var/local/plugins -e "$(< $CONFIG_FILE)"
```
