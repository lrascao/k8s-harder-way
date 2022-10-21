
# KUBERNETES_CLUSTER_INTERNAL_ADDRESS should match with the --service-cluster-ip-range parameter
KUBERNETES_CLUSTER_IP_CIDR=10.32.0.0/24
KUBERNETES_CLUSTER_INTERNAL_ADDRESS=10.32.0.1
KUBERNETES_CLUSTER_DNS=10.32.0.10
KUBERNETES_POD_CIDR=192.168.0.0/16

KUBERNETES_PUBLIC_ADDRESS=kubernetes.home
KUBERNETES_HOSTNAMES=kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster,kubernetes.svc.cluster.local
