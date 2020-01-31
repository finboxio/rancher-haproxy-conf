FROM finboxio/rancher-conf-aws:v1.0.0

VOLUME /etc/rancher-conf/haproxy

ENV GO111MODULE=on
RUN apk add --no-cache certbot python3 py3-pip && \
  pip3 install certbot-dns-route53 && \
  apk del py3-pip

ADD config.toml /etc/rancher-conf/

ADD templates /etc/rancher-conf/templates
ADD scripts /etc/rancher-conf/scripts

ADD run.sh /opt/rancher/bin/
