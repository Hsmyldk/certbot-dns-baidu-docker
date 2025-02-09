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

ENTRYPOINT ["certbot","-a","dns-baidu"]
