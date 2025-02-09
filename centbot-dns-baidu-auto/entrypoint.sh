#!/bin/bash

# Activate the virtual environment
source /opt/venv/bin/activate

# Obtain the certificate
/usr/local/bin/certonly.sh "$DOMAINS"

# Start cron daemon
crond -f -l 2
