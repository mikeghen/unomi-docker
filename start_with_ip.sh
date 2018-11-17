#!/bin/sh

sed -i "s/elasticSearchAddresses=localhost:9300/elasticSearchAddresses=${ELASTICSEARCH_HOST}:${ELASTICSEARCH_PORT}/g" /opt/apache-unomi/etc/org.apache.unomi.persistence.elasticsearch.cfg
$KARAF_HOME/bin/start
sleep 60
$KARAF_HOME/bin/client "unomi:start"
echo "Started Unomi"
tail -f $KARAF_HOME/data/log/karaf.log
