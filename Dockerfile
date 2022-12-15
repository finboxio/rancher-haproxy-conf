FROM certbot/dns-cloudflare:latest

VOLUME /opt/rancher/bin
VOLUME /etc/rancher-conf/haproxy

ENV GO111MODULE=on
ENV PATH=$PATH:/root/go/bin
RUN apk add --no-cache go git openssl curl \
    coreutils docker-cli && \
    go install github.com/finboxio/rancher-conf/cmd/rancher-conf@v0.7.3 && \
    go install github.com/belitre/gotpl@latest && \
    wget -O /usr/local/bin/yq "https://github.com/mikefarah/yq/releases/download/2.4.1/yq_linux_amd64" && \
    chmod +x /usr/local/bin/yq && \
    wget -O /usr/local/bin/jq "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64" && \
    chmod +x /usr/local/bin/jq && \
    rm -rf /root/go/src && \
    apk del go git

ADD config.toml /etc/rancher-conf/
ADD templates /etc/rancher-conf/templates
ADD scripts /etc/rancher-conf/scripts
ADD run.sh /opt/rancher/bin/

ENTRYPOINT [ "rancher-conf", "--config", "/etc/rancher-conf/config.toml" ]
