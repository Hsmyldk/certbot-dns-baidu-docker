FROM alpine:latest

# Install dependencies
RUN apk --no-cache add wget tar sudo certbot bash python3 py3-pip && \
    apk --no-cache add --virtual build-dependencies gcc musl-dev python3-dev libffi-dev openssl-dev make

# Create virtual environment for Python packages
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Python dependencies in virtual environment
RUN pip install --upgrade pip

# 安装certbot插件
COPY certbot_dns_baidu-0.2.0-py2.py3-none-any.whl /var/lib/letsencrypt/certbot_dns_baidu-0.2.0-py2.py3-none-any.whl
RUN pip install /var/lib/letsencrypt/certbot_dns_baidu-0.2.0-py2.py3-none-any.whl

# 复制启动sh
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# 复制申请证书sh
COPY certonly.sh /usr/local/bin/certonly.sh
RUN chmod +x /usr/local/bin/certonly.sh

ENV CONF_PATH="/var/lib/letsencrypt/credentials.ini"
ENV DOMAINS=""
ENV PROPAGATION_SECONDS=120
ENV EMAIL=""
ENV CRON_SCHEDULE="0 0 0 * *"

# 设置续期证书定时任务
RUN echo "$CRON_SCHEDULE certbot renew -a dns-baidu --dns-baidu-credentials $CONF_PATH --dns-baidu-propagation-seconds 120 --email $EMAIL" >> /var/lib/letsencrypt/renwe.log
# RUN echo "$CRON_SCHEDULE certbot renew --dry-run -a dns-baidu --dns-baidu-credentials $CONF_PATH --dns-baidu-propagation-seconds 120 --email $EMAIL" >> /var/lib/letsencrypt/renwe.log

WORKDIR /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
