FROM alpine

ENV VERSION 3.2.24
ENV ETCD_ENDPOINT 127.0.0.1:2379

RUN apk-install curl && \
    curl -LOks https://github.com/coreos/etcd/releases/download/v${VERSION}/etcd-v${VERSION}-linux-amd64.tar.gz && \
    tar zxvf etcd-v${VERSION}-linux-amd64.tar.gz && \
    cp etcd-v${VERSION}-linux-amd64/etcdctl /etcdctl && \
    rm -rf etcd-v* && \
    chmod +x /etcdctl

ENTRYPOINT ["/etcdctl"]
