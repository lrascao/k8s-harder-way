#!/bin/bash

source ${_ROOT}/config/kubernetes.sh

kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=../../certs/CA/ca.pem \
    --embed-certs=true \
    --server=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
    --kubeconfig=kube-scheduler.kubeconfig

kubectl config set-credentials system:kube-scheduler \
    --client-certificate=../../certs/kube-scheduler/kube-scheduler.pem \
    --client-key=../../certs/kube-scheduler/kube-scheduler-key.pem \
    --embed-certs=true \
    --kubeconfig=kube-scheduler.kubeconfig

kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:kube-scheduler \
    --kubeconfig=kube-scheduler.kubeconfig

kubectl config use-context default --kubeconfig=kube-scheduler.kubeconfig

