#!/bin/bash

source ../../config/nodes.sh
source ../../config/kubernetes.sh

PRIVATE_ADDRESSES=${WORKER_NODE1_PRIVATE_ADDRESS},${WORKER_NODE2_PRIVATE_ADDRESS} && \
cfssl gencert \
  -ca=../CA/ca.pem \
  -ca-key=../CA/ca-key.pem \
  -config=../CA/ca-config.json \
  -hostname=${KUBERNETES_CLUSTER_INTERNAL_ADDRESS},${KUBERNETES_PUBLIC_ADDRESS},${PRIVATE_ADDRESS},127.0.0.1,${KUBERNETES_HOSTNAMES} \
  -profile=kubernetes \
  kube-apiserver-csr.json | cfssljson -bare kube-apiserver
