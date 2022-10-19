cfssl gencert \
  -ca=../CA/ca.pem \
  -ca-key=../CA/ca-key.pem \
  -config=../CA/ca-config.json \
  -profile=kubernetes \
  service-account-csr.json | cfssljson -bare service-account
