#!/bin/bash

for d in etcd kube-apiserver kube-controller-manager kube-scheduler service-account admin 
do
    pushd $d; ./generate.sh; popd
done
