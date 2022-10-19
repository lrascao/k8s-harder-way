# Generate Peer certificate

LOCALHOST=127.0.0.1 \
ETCD_PRIVATE_ADDRESSES=192.168.3.173 && \
cfssl gencert \
  -ca=../../CA/ca.pem \
  -ca-key=../../CA/ca-key.pem \
  -config=../../CA/ca-config.json \
  -profile=etcd-peer \
  -hostname="etcd1","etcd1.local","etcd1.home",${LOCALHOST},${ETCD_PRIVATE_ADDRESSES} \
  etcd-peer-csr-etcd1.json | cfssljson -bare etcd1-peer

