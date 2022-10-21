#!/bin/bash

source ${_ROOT}/config/kubernetes.sh

./kube-scheduler \
  --bind-address=0.0.0.0 \
  --client-ca-file=../../certs/CA/ca.pem \
  --kubeconfig=../../config/kube-controller-manager/kube-scheduler.kubeconfig \
  --config=../../config/kube-scheduler/kube-scheduler.yaml \
  --tls-cert-file=../../certs/kube-scheduler/kube-scheduler.pem \
  --tls-private-key-file=../../certs/kube-scheduler/kube-scheduler-key.pem \
  --v=2
