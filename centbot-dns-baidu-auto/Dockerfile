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

# 复制申请证书sh
COPY certonly.sh /usr/local/bin/certonly.sh
RUN chmod +x /usr/local/bin/certonly.sh

# 复制续期证书sh
COPY renew.sh /usr/local/bin/renew.sh
RUN chmod +x /usr/local/bin/renew.sh

# 复制cron执行sh
COPY cron.sh /etc/periodic/daily/cron.sh
RUN chmod +x /etc/periodic/daily/cron.sh

ENV CONF_PATH="/var/lib/letsencrypt/credentials.ini"
ENV PROPAGATION_SECONDS=120
ENV EMAIL=""

WORKDIR /usr/local/bin/

ENTRYPOINT ["crond","-f","-l","2"]
