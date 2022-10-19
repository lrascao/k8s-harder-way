#!/bin/bash

source ${_ROOT}/config/kubernetes.sh
source ${_ROOT}/config/nodes.sh
source ${_ROOT}/bin/etcd/common/membership.sh

PRIVATE_ADDRESS=${WORKER_NODE1_PRIVATE_ADDRESS} && \
ETCD_ADDRESSES=https://${ETCD1_PRIVATE_ADDRESS}:${ETCD1_CLIENT_PORT},https://${ETCD2_PRIVATE_ADDRESS}:${ETCD1_CLIENT_PORT} && \
./kube-apiserver \
  --advertise-address=${PRIVATE_ADDRESS} \
  --allow-privileged=true \
  --apiserver-count=3 \
  --audit-log-maxage=30 \
  --audit-log-maxbackup=3 \
  --audit-log-maxsize=100 \
  --audit-log-path=log/audit/apiserver.log \
  --authorization-mode=Node,RBAC \
  --bind-address=0.0.0.0 \
  --client-ca-file=../../certs/CA/ca.pem \
  --enable-admission-plugins=NamespaceLifecycle,NodeRestriction,LimitRanger,ServiceAccount,DefaultStorageClass,ResourceQuota \
  --etcd-cafile=../../certs/CA/ca.pem \
  --etcd-certfile=../../certs/etcd/etcd-client.pem \
  --etcd-keyfile=../../certs/etcd/etcd-client-key.pem \
  --etcd-servers=${ETCD_ADDRESSES} \
  --event-ttl=1h \
  --encryption-provider-config=../../data/encryption-config.yaml \
  --kubelet-certificate-authority=../../certs/CA/ca.pem \
  --kubelet-client-certificate=../../certs/kube-apiserver/kube-apiserver.pem \
  --kubelet-client-key=../../certs/kube-apiserver/kube-apiserver-key.pem \
  --runtime-config='api/all=true' \
  --service-account-key-file=../../certs/service-account/service-account.pem \
  --service-account-signing-key-file=../../certs/service-account/service-account-key.pem \
  --service-account-issuer=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
  --service-cluster-ip-range=${KUBERNETES_CLUSTER_IP_CIDR} \
  --service-node-port-range=30000-32767 \
  --tls-cert-file=../../certs/kube-apiserver/kube-apiserver.pem \
  --tls-private-key-file=../../certs/kube-apiserver/kube-apiserver-key.pem \
  --v=2
