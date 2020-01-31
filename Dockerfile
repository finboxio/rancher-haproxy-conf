FROM finboxio/rancher-conf-aws:v0.5.0

VOLUME /etc/rancher-conf/haproxy

ENV GO111MODULE=on
RUN apk add --no-cache coreutils certbot docker go && \
  go get github.com/finboxio/rancher-conf/cmd/rancher-conf@e06f7a5 && \
  go get github.com/tsg/gotpl && \
  wget -O /usr/local/bin/yq "https://github.com/mikefarah/yq/releases/download/2.4.1/yq_linux_amd64" && \
  wget -O /usr/local/bin/jq "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64" && \
  apk del go

ADD config.toml /etc/rancher-conf/

ADD templates /etc/rancher-conf/
ADD scripts /etc/rancher-conf/

ADD run.sh /opt/rancher/bin/
