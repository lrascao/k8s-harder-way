#!/bin/bash

for d in admin kube-controller-manager kube-proxy kube-scheduler kubelet
do
    pushd $d; ./generate.sh; popd
done
