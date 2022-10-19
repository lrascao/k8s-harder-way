#!/bin/sh

source ${_ROOT}/bin/etcd/common/membership.sh

ESCAPED_MEMBERSHIP=$(printf '%s\n' "$ETCD_CLUSTER_MEMBERSHIP" | sed -e 's/[\/&]/\\&/g')

sed -e "s/%ETCD_NAME%/${ETCD1_NAME}/g" \
    -e "s/%ETCD_PRIVATE_ADDRESS%/${ETCD1_PRIVATE_ADDRESS}/g" \
    -e "s/%ETCD_PUBLIC_ADDRESS%/${ETCD1_PUBLIC_ADDRESS}/g" \
    -e "s/%ETCD_CLIENT_PORT%/${ETCD1_CLIENT_PORT}/g" \
    -e "s/%ETCD_PEER_PORT%/${ETCD1_PEER_PORT}/g" \
    -e "s/%ETCD_CLUSTER_MEMBERSHIP%/${ESCAPED_MEMBERSHIP}/g" \
    ../etcd-conf.yaml > etcd1-conf.yaml
../etcd --config-file etcd1-conf.yaml
