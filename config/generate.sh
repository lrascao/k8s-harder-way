#!/bin/bash

for d in admin kube-controller-manager kube-proxy kube-scheduler kubelet cni
do
    pushd $d; ./generate.sh; popd
done
