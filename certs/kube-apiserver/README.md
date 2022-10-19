# CLUSTER_INTERNAL_ADDRESS should match with the --service-cluster-ip-range parameter

CLUSTER_INTERNAL_ADDRESS=10.32.0.1 \
PUBLIC_ADDRESS=kubernetes.home \
PRIVATE_ADDRESS=192.168.3.173 \
KUBERNETES_HOSTNAMES=kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster,kubernetes.svc.cluster.local && \
cfssl gencert \
  -ca=../CA/ca.pem \
  -ca-key=../CA/ca-key.pem \
  -config=../CA/ca-config.json \
  -hostname=${CLUSTER_INTERNAL_ADDRESS},${PUBLIC_ADDRESS},${PRIVATE_ADDRESS},127.0.0.1,${KUBERNETES_HOSTNAMES} \
  -profile=kubernetes \
  kube-api-server-csr.json | cfssljson -bare kube-api-server
