#!/bin/bash

source ${_ROOT}/config/nodes.sh
source ${_ROOT}/config/kubernetes.sh

mkdir ${WORKER_NODE_NAME}
cat > ${WORKER_NODE_NAME}/${WORKER_NODE_NAME}-csr.json <<EOF
{
  "CN": "system:node:${WORKER_NODE_NAME}",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "US",
      "L": "Portland",
      "O": "system:nodes",
      "ST": "Oregon"
    }
  ]
}
EOF

cfssl gencert \
  -ca=../CA/ca.pem \
  -ca-key=../CA/ca-key.pem \
  -config=../CA/ca-config.json \
  -hostname=${WORKER_NODE_NAME},${WORKER_NODE_PUBLIC_ADDRESS},${WORKER_NODE_PRIVATE_ADDRESS} \
  -profile=kubernetes \
  ${WORKER_NODE_NAME}/${WORKER_NODE_NAME}-csr.json | cfssljson -bare ${WORKER_NODE_NAME}/${WORKER_NODE_NAME}

