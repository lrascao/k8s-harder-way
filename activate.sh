#!/bin/bash

kubernetes-env() {
    echo "export PATH=`pwd`/bin/cfssl:`pwd`/bin/kubernetes:$PATH"
    echo "export _ROOT=`pwd`"
}
