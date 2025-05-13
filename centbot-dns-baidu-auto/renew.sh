#!/bin/bash

certbot renew -a dns-baidu --dns-baidu-credentials $CONF_PATH --dns-baidu-propagation-seconds 120 --email $EMAIL >> /var/lib/letsencrypt/renwe.log