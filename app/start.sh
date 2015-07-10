#!/bin/bash

echo "Configuring dev_config.json..."

export XMPP_NAME="$(echo ${XMPP_NAME} | sed 's/\//\\\//g')"
export XMPP_DOMAIN="$(echo ${XMPP_DOMAIN} | sed 's/\//\\\//g')"
export XMPP_WSS="$(echo ${XMPP_WSS} | sed 's/\//\\\//g')"
export XMPP_MUC="$(echo ${XMPP_MUC} | sed 's/\//\\\//g')"
export XMPP_STARTUP="$(echo ${XMPP_STARTUP} | sed 's/\//\\\//g')"
export XMPP_ADMIN="$(echo ${XMPP_ADMIN} | sed 's/\//\\\//g')"

sed 's/{{XMPP_NAME}}/'"${XMPP_NAME}"'/' -i /kaiwa/app/config/dev_config.json
sed 's/{{XMPP_DOMAIN}}/'"${XMPP_DOMAIN}"'/' -i /kaiwa/app/config/dev_config.json
sed 's/{{XMPP_WSS}}/'"${XMPP_WSS}"'/' -i /kaiwa/app/config/dev_config.json
sed 's/{{XMPP_MUC}}/'"${XMPP_MUC}"'/' -i /kaiwa/app/config/dev_config.json
sed 's/{{XMPP_STARTUP}}/'"${XMPP_STARTUP}"'/' -i /kaiwa/app/config/dev_config.json
sed 's/{{XMPP_ADMIN}}/'"${XMPP_ADMIN}"'/' -i /kaiwa/app/config/dev_config.json

sed 's/{{LDAP_HOST}}/'"${LDAP_PORT_389_TCP_ADDR}"'/' -i /kaiwa/app/config/dev_config.json
sed 's/{{LDAP_BASE}}/'"${LDAP_BASE}"'/' -i /kaiwa/app/config/dev_config.json
sed 's/{{LDAP_DN}}/'"${LDAP_DN}"'/' -i /kaiwa/app/config/dev_config.json
sed 's/{{LDAP_PWD}}/'"${LDAP_PWD}"'/' -i /kaiwa/app/config/dev_config.json
sed 's/{{LDAP_GROUP}}/'"${LDAP_GROUP}"'/' -i /kaiwa/app/config/dev_config.json

cp /kaiwa/app/config/dev_config.json /kaiwa

echo "Configuring kaiwa..."

cd kaiwa

cp /kaiwa/app/stanza.io/websocket.js node_modules/stanza.io/lib/transports
cp /kaiwa/app/stanza.io/index-browser.js node_modules/stanza.io/lib/plugins
cp /kaiwa/app/stanza.io/muc.js node_modules/stanza.io/lib/stanza

node server
