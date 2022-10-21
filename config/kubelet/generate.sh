#!/bin/bash

source ${_ROOT}/config/kubernetes.sh
source ${_ROOT}/config/nodes.sh

ESCAPED_KUBERNETES_POD_CIDR=$(printf '%s\n' "$KUBERNETES_POD_CIDR" | sed -e 's/[\/&]/\\&/g')

mkdir -p ${WORKER_NODE_NAME}

sed -e "s/%KUBERNETES_CLUSTER_DNS%/${KUBERNETES_CLUSTER_DNS}/g" \
    -e "s/%KUBERNETES_POD_CIDR%/${ESCAPED_KUBERNETES_POD_CIDR}/g" \
    -e "s/%WORKER_NODE_NAME%/${WORKER_NODE_NAME}/g" \
    kubelet-config.yaml.template > ${WORKER_NODE_NAME}/kubelet-config.yaml

kubectl config set-cluster kubernetes-the-hard-way \
  --certificate-authority=../../certs/CA/ca.pem \
  --embed-certs=true \
  --server=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
  --kubeconfig=${WORKER_NODE_NAME}/${WORKER_NODE_NAME}.kubeconfig

kubectl config set-credentials system:node:${WORKER_NODE_NAME} \
  --client-certificate=../../certs/kubelet/${WORKER_NODE_NAME}/${WORKER_NODE_NAME}.pem \
  --client-key=../../certs/kubelet/${WORKER_NODE_NAME}/${WORKER_NODE_NAME}-key.pem \
  --embed-certs=true \
  --kubeconfig=${WORKER_NODE_NAME}/${WORKER_NODE_NAME}.kubeconfig

kubectl config set-context default \
  --cluster=kubernetes-the-hard-way \
  --user=system:node:${WORKER_NODE_NAME} \
  --kubeconfig=${WORKER_NODE_NAME}/${WORKER_NODE_NAME}.kubeconfig

kubectl config use-context default --kubeconfig=${WORKER_NODE_NAME}/${WORKER_NODE_NAME}.kubeconfig
