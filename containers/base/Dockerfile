# registry.cloudogu.com/official/base:3.3-1
FROM alpine:3.3
MAINTAINER Sebastian Sdorra <sebastian.sdorra@cloudogu.com>

# etcd version
ENV CES_ETCD_VERSION 2.1.3
ENV DOGUCTL_VERSION 0.1.1

# install etcd
RUN apk add --update bash curl openssl wget curl zip unzip mysql-client ca-certificates jq \
    && curl -L https://github.com/coreos/etcd/releases/download/v${CES_ETCD_VERSION}/etcd-v${CES_ETCD_VERSION}-linux-amd64.tar.gz -o /tmp/etcd.tar.gz \
    && mkdir /tmp/etcd \
    && tar xzvf /tmp/etcd.tar.gz -C /tmp/etcd \
    && mv /tmp/etcd/etcd-v${CES_ETCD_VERSION}-linux-amd64/etcdctl /bin
COPY ./resources/doguctl-${DOGUCTL_VERSION}.tar.gz /tmp/doguctl-${DOGUCTL_VERSION}.tar.gz
RUN cat /tmp/doguctl-${DOGUCTL_VERSION}.tar.gz | gunzip | tar -x -O > /usr/bin/doguctl \
    && chmod +x /usr/bin/doguctl && rm -rf /tmp/etcd* /var/cache/apk/* \
    && rm /tmp/doguctl-${DOGUCTL_VERSION}.tar.gz
