#!/bin/bash

chmod 600 "$CONF_PATH"
certbot certonly -a dns-baidu --dns-baidu-credentials "$CONF_PATH" --dns-baidu-propagation-seconds $PROPAGATION_SECONDS --preferred-challenges dns --expand --agree-tos --email $EMAIL --non-interactive $1
# certbot certonly -a dns-baidu --dry-run --dns-baidu-credentials "$CONF_PATH" --dns-baidu-propagation-seconds $PROPAGATION_SECONDS --preferred-challenges dns --expand --agree-tos --email $EMAIL --non-interactive $1
