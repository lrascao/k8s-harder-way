* API server

INTERNAL_IP=192.168.3.185 KUBERNETES_PUBLIC_ADDRESS=127.0.0.1 && \
./kube-apiserver \
  --advertise-address=${INTERNAL_IP} \
  --allow-privileged=true \
  --apiserver-count=3 \
  --audit-log-maxage=30 \
  --audit-log-maxbackup=3 \
  --audit-log-maxsize=100 \
  --audit-log-path=log/audit/apiserver.log \
  --authorization-mode=Node,RBAC \
  --bind-address=0.0.0.0 \
  --client-ca-file=../../certs/CA/ca.pem \
  --enable-admission-plugins=NamespaceLifecycle,NodeRestriction,LimitRanger,ServiceAccount,DefaultStorageClass,ResourceQuota \
  --etcd-cafile=../../certs/CA/ca.pem \
  --etcd-certfile=../../certs/etcd/etcd.pem \
  --etcd-keyfile=../../certs/etcd/etcd-key.pem \
  --etcd-servers=https://127.0.0.1:2310 \
  --event-ttl=1h \
  --encryption-provider-config=../../data/encryption-config.yaml \
  --kubelet-certificate-authority=../../certs/CA/ca.pem \
  --kubelet-client-certificate=../../certs/kube-api-server/kube-api-server.pem \
  --kubelet-client-key=../../certs/kube-api-server/kube-api-server-key.pem \
  --runtime-config='api/all=true' \
  --service-account-key-file=../../certs/service-account/service-account.pem \
  --service-account-signing-key-file=../../certs/service-account/service-account-key.pem \
  --service-account-issuer=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
  --service-cluster-ip-range=10.32.0.0/24 \
  --service-node-port-range=30000-32767 \
  --tls-cert-file=../../certs/kube-api-server/kube-api-server.pem \
  --tls-private-key-file=../../certs/kube-api-server/kube-api-server-key.pem \
  --v=2

* Kube Controller Manager

./kube-controller-manager \
  --bind-address=0.0.0.0 \
  --cluster-cidr=10.200.0.0/16 \
  --cluster-name=kubernetes \
  --cluster-signing-cert-file=../../certs/CA/ca.pem \
  --cluster-signing-key-file=../../certs/CA/ca-key.pem \
  --kubeconfig=../../config/kube-controller-manager/kube-controller-manager.kubeconfig \
  --leader-elect=true \
  --root-ca-file=../../certs/CA/ca.pem \
  --service-account-private-key-file=../../certs/service-account/service-account-key.pem \
  --service-cluster-ip-range=10.32.0.0/24 \
  --use-service-account-credentials=true \
  --v=2

* Kube Scheduler

./kube-scheduler \
  --config=kube-scheduler.yaml \
  --v=2

* Kubectl

./kubectl --kubeconfig ../../config/admin/admin.kubeconfig get pods --all-namespaces
