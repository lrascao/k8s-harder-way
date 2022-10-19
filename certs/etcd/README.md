# Generate Server certificate

LOCALHOST=127.0.0.1 \
ETCD_PUBLIC_ADDRESSES=192.168.3.173 && \
cfssl gencert \
  -ca=../CA/ca.pem \
  -ca-key=../CA/ca-key.pem \
  -config=../CA/ca-config.json \
  -profile=etcd-server \
  -hostname=${LOCALHOST},${ETCD_PUBLIC_ADDRESSES} \
  etcd-server-csr.json | cfssljson -bare etcd-server

# Generate Peer certificates (one for each member)

* etcd1/README.md
* etcd2/README.md

# Generate Client certificate

cfssl gencert \
  -ca=../CA/ca.pem \
  -ca-key=../CA/ca-key.pem \
  -config=../CA/ca-config.json \
  -profile=etcd-client \
  etcd-client-csr.json | cfssljson -bare etcd-client

