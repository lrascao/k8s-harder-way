#!/bin/bash

source ${_ROOT}/config/kubernetes.sh

./kube-controller-manager \
  --bind-address=0.0.0.0 \
  --cluster-name=kubernetes \
  --cluster-signing-cert-file=../../certs/CA/ca.pem \
  --cluster-signing-key-file=../../certs/CA/ca-key.pem \
  --kubeconfig=../../config/kube-controller-manager/kube-controller-manager.kubeconfig \
  --leader-elect=true \
  --root-ca-file=../../certs/CA/ca.pem \
  --service-account-private-key-file=../../certs/service-account/service-account-key.pem \
  --service-cluster-ip-range=${KUBERNETES_CLUSTER_IP_CIDR} \
  --use-service-account-credentials=true \
  --flex-volume-plugin-dir=../../data/flex-volume \
  --v=2
