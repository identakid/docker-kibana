#!/bin/sh

set -e

KIBANA_ES_URL=${KIBANA_ES_URL:-http://elasticsearch:9200}
KIBANA_INDEX=${KIBANA_INDEX:-kibana-int}
KIBANA_ES_PRESERVE_HOST=${KIBANA_ES_PRESERVE_HOST:-true}

sed -i "s;^elasticsearch_url:.*;elasticsearch_url: ${KIBANA_ES_URL};" "/opt/kibana-${KIBANA_VERSION}/config/kibana.yml"
sed -i "s;^kibana_index:.*;kibana_index: ${KIBANA_INDEX};" "/opt/kibana-${KIBANA_VERSION}/config/kibana.yml"
sed -i "s;^elasticsearch_preserve_host: true;elasticsearch_preserve_host: ${KIBANA_ES_PRESERVE_HOST};" "/opt/kibana-${KIBANA_VERSION}/config/kibana.yml"

exec /opt/kibana-${KIBANA_VERSION}/bin/kibana
