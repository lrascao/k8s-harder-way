#!/bin/bash 

source ${_ROOT}/config/kubernetes.sh

kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=../../certs/CA/ca.pem \
    --embed-certs=true \
    --server=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
    --kubeconfig=admin.kubeconfig

kubectl config set-credentials admin \
    --client-certificate=../../certs/admin/admin.pem \
    --client-key=../../certs/admin/admin-key.pem \
    --embed-certs=true \
    --kubeconfig=admin.kubeconfig

kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=admin \
    --kubeconfig=admin.kubeconfig

kubectl config use-context default --kubeconfig=admin.kubeconfig
