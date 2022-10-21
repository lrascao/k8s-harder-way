#!/bin/bash

source ${_ROOT}/config/nodes.sh

# Generate Server certificate
LOCALHOST=127.0.0.1 \
ETCD_PUBLIC_ADDRESSES="${WORKER_NODE1_PUBLIC_ADDRESS}","${WORKER_NODE2_PUBLIC_ADDRESS}" && \
cfssl gencert \
  -ca=../CA/ca.pem \
  -ca-key=../CA/ca-key.pem \
  -config=../CA/ca-config.json \
  -profile=etcd-server \
  -hostname="etcd","etcd.local","etcd.home","${LOCALHOST}",${ETCD_PUBLIC_ADDRESSES} \
  etcd-server-csr.json | cfssljson -bare etcd-server

# Generate Client certificate
cfssl gencert \
  -ca=../CA/ca.pem \
  -ca-key=../CA/ca-key.pem \
  -config=../CA/ca-config.json \
  -profile=etcd-client \
  etcd-client-csr.json | cfssljson -bare etcd-client

for etcd in etcd1 etcd2
do
    pushd $etcd; ./generate.sh; popd
done
