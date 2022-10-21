#!/bin/bash

CFSSL_VERSION=1.6.1
ETCD_VERSION=3.5.5
KUBERNETES_VERSION=1.25.3
CRI_TOOLS_VERSION=1.25.0

git clone --depth=1 -b v${CFSSL_VERSION} https://github.com/cloudflare/cfssl.git src/cfssl-${CFSSL_VERSION}
pushd src/cfssl-${CFSSL_VERSION}; make; popd; mkdir -p bin/cfssl; cp src/cfssl-${CFSSL_VERSION}/bin/* bin/cfssl

git clone --depth=1 -b v${ETCD_VERSION} https://github.com/etcd-io/etcd.git src/etcd-${ETCD_VERSION}
pushd src/etcd-${ETCD_VERSION}; make; popd; mkdir -p bin/etcd; cp src/etcd-${ETCD_VERSION}/bin/etcd src/etcd-${ETCD_VERSION}/bin/etcdctl bin/etcd

git clone --depth=1 -b v${KUBERNETES_VERSION} https://github.com/kubernetes/kubernetes.git src/kubernetes-${KUBERNETES_VERSION}
mkdir -p bin/kubernetes
OS=`uname -s | awk '{print tolower($0)}'`
pushd src/kubernetes-${KUBERNETES_VERSION}; \
    make WHAT=cmd/kubectl; cp _output/local/bin/${OS}/amd64/kubectl ../../bin/kubernetes; \
    make WHAT=cmd/kube-apiserver; cp _output/local/bin/${OS}/amd64/kube-apiserver ../../bin/kubernetes; \
    make WHAT=cmd/kube-controller-manager; cp _output/local/bin/${OS}/amd64/kube-controller-manager ../../bin/kubernetes; \
    make WHAT=cmd/kube-scheduler; cp _output/local/bin/${OS}/amd64/kube-scheduler ../../bin/kubernetes; \
    make WHAT=cmd/kube-proxy; cp _output/local/bin/${OS}/amd64/kube-proxy ../../bin/kubernetes; \
    make WHAT=cmd/kubelet; cp _output/local/bin/${OS}/amd64/kubelet ../../bin/kubernetes; \
popd;

git clone --depth=1 -b v${CRI_TOOLS_VERSION} https://github.com/kubernetes-sigs/cri-tools.git src/cri-tools-${CRI_TOOLS_VERSION}
pushd src/cri-tools-${CRI_TOOLS_VERSION}; make; popd; cp src/cri-tools-${CRI_TOOLS_VERSION}/build/bin/crictl bin/kubernetes
