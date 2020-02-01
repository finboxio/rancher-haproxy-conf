FROM alpine:latest

VOLUME /opt/rancher/bin
VOLUME /etc/rancher-conf/haproxy

ENV GO111MODULE=on
ENV PATH=$PATH:/root/go/bin
RUN apk add --no-cache go git \
      certbot python3 py3-pip \
      coreutils docker-cli && \
    pip3 install certbot-dns-route53 && \
    go get github.com/finboxio/rancher-conf/cmd/rancher-conf@v0.4.0 && \
    go get github.com/tsg/gotpl && \
    wget -O /usr/local/bin/yq "https://github.com/mikefarah/yq/releases/download/2.4.1/yq_linux_amd64" && \
    chmod +x /usr/local/bin/yq && \
    wget -O /usr/local/bin/jq "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64" && \
    chmod +x /usr/local/bin/jq && \
    rm -rf /root/go/src && \
    apk del go git py3-pip

ADD config.toml /etc/rancher-conf/
ADD templates /etc/rancher-conf/templates
ADD scripts /etc/rancher-conf/scripts
ADD run.sh /opt/rancher/bin/

ENTRYPOINT [ "rancher-conf", "--config", "/etc/rancher-conf/config.toml" ]
