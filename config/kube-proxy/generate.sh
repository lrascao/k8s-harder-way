#!/bin/bash

source ${_ROOT}/config/kubernetes.sh
source ${_ROOT}/config/nodes.sh

kubectl config set-cluster kubernetes-the-hard-way \
  --certificate-authority=../../certs/CA/ca.pem \
  --embed-certs=true \
  --server=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
  --kubeconfig=${WORKER_NODE_NAME}.kubeconfig

kubectl config set-credentials system:node:${WORKER_NODE_NAME} \
  --client-certificate=../../certs/kubeproxy/${WORKER_NODE_NAME}/${WORKER_NODE_NAME}.pem \
  --client-key=../../certs/kubeproxy/${${WORKER_NODE_NAME}}/${${WORKER_NODE_NAME}}-key.pem \
  --embed-certs=true \
  --kubeconfig=${${WORKER_NODE_NAME}}.kubeconfig

kubectl config set-context default \
  --cluster=kubernetes-the-hard-way \
  --user=system:node:${${WORKER_NODE_NAME}} \
  --kubeconfig=${${WORKER_NODE_NAME}}.kubeconfig

kubectl config use-context default --kubeconfig=${instance}.kubeconfig
