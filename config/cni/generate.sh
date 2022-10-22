#!/bin/bash

source ${_ROOT}/config/kubernetes.sh
source ${_ROOT}/config/nodes.sh

ESCAPED_KUBERNETES_POD_CIDR=$(printf '%s\n' "$KUBERNETES_POD_CIDR" | sed -e 's/[\/&]/\\&/g')

sed -e "s/%KUBERNETES_POD_CIDR%/${ESCAPED_KUBERNETES_POD_CIDR}/g" \
    10-bridge.conf.template > 10-bridge.conf

