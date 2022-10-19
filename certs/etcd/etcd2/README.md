# Generate Peer certificate

LOCALHOST=127.0.0.1 \
ETCD_PRIVATE_ADDRESSES=192.168.3.173,1.1.1.1,2.2.2.2,3.3.3.3 && \
cfssl gencert \
  -ca=../../CA/ca.pem \
  -ca-key=../../CA/ca-key.pem \
  -config=../../CA/ca-config.json \
  -profile=etcd-peer \
  -hostname="etcd2","etcd2.local","etcd2.home",${LOCALHOST},${ETCD_PRIVATE_ADDRESSES} \
  etcd-peer-csr-etcd2.json | cfssljson -bare etcd2-peer

