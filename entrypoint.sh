#!/bin/sh

# TODO: replace with if statement
sed -i "s/elasticSearchAddresses=localhost:9300/elasticSearchAddresses=${ELASTICSEARCH_HOST}:${ELASTICSEARCH_PORT}/g" /opt/apache-unomi/etc/org.apache.unomi.persistence.elasticsearch.cfg
# TODO: handle elasticsearch authentication
$KARAF_HOME/bin/start
sleep 120  # TODO: Replace with if statement
$KARAF_HOME/bin/client "unomi:start"
echo "Started Unomi"
tail -f $KARAF_HOME/data/log/karaf.log
