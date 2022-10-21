#!/bin/bash

source ${_ROOT}/config/nodes.sh

LOCALHOST=127.0.0.1 \
ETCD_PRIVATE_ADDRESSES=${WORKER_NODE1_PRIVATE_ADDRESS} && \
cfssl gencert \
  -ca=../../CA/ca.pem \
  -ca-key=../../CA/ca-key.pem \
  -config=../../CA/ca-config.json \
  -profile=etcd-peer \
  -hostname=${LOCALHOST},${ETCD_PRIVATE_ADDRESSES} \
  etcd-peer-csr-etcd1.json | cfssljson -bare etcd1-peer

