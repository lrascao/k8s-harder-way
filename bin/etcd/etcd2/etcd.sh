#!/bin/sh

source ${_ROOT}/bin/etcd/common/membership.sh

ESCAPED_MEMBERSHIP=$(printf '%s\n' "$ETCD_CLUSTER_MEMBERSHIP" | sed -e 's/[\/&]/\\&/g')

sed -e "s/%ETCD_NAME%/${ETCD2_NAME}/g" \
    -e "s/%ETCD_PRIVATE_ADDRESS%/${ETCD2_PRIVATE_ADDRESS}/g" \
    -e "s/%ETCD_PUBLIC_ADDRESS%/${ETCD2_PUBLIC_ADDRESS}/g" \
    -e "s/%ETCD_CLIENT_PORT%/${ETCD2_CLIENT_PORT}/g" \
    -e "s/%ETCD_PEER_PORT%/${ETCD2_PEER_PORT}/g" \
    -e "s/%ETCD_CLUSTER_MEMBERSHIP%/${ESCAPED_MEMBERSHIP}/g" \
    ../etcd-conf.yaml > etcd2-conf.yaml
../etcd --config-file etcd2-conf.yaml
