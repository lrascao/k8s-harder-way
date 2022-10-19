
source ${_ROOT}/config/nodes.sh

# etcd1
ETCD1_NAME=etcd1
ETCD1_PRIVATE_ADDRESS=${WORKER_NODE1_PRIVATE_ADDRESS}
ETCD1_PUBLIC_ADDRESS=${WORKER_NODE1_PUBLIC_ADDRESS}
ETCD1_PEER_PORT=2380
ETCD1_CLIENT_PORT=2379

# etcd2
ETCD2_NAME=etcd2
ETCD2_PRIVATE_ADDRESS=${WORKER_NODE2_PRIVATE_ADDRESS}
ETCD2_PUBLIC_ADDRESS=${WORKER_NODE2_PUBLIC_ADDRESS}
ETCD2_PEER_PORT=2382
ETCD2_CLIENT_PORT=2381

ETCD_CLUSTER_MEMBERSHIP=etcd1=https://${ETCD1_PRIVATE_ADDRESS}:${ETCD1_PEER_PORT},etcd2=https://${ETCD2_PRIVATE_ADDRESS}:${ETCD2_PEER_PORT}
