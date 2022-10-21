KUBERNETES_PUBLIC_ADDRESS=127.0.0.1 && \
for instance in worker1; do
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=../../certs/CA/ca.pem \
    --embed-certs=true \
    --server=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
    --kubeconfig=${WORKER_NODE_NAME}.kubeconfig

  kubectl config set-credentials system:node:${instance} \
    --client-certificate=../../certs/kubelet/${WORKER_NODE_NAME}/${WORKER_NODE_NAME}.pem \
    --client-key=../../certs/kubelet/${WORKER_NODE_NAME}/${WORKER_NODE_NAME}-key.pem \
    --embed-certs=true \
    --kubeconfig=${WORKER_NODE_NAME}.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:node:${instance} \
    --kubeconfig=${WORKER_NODE_NAME}.kubeconfig

  kubectl config use-context default --kubeconfig=${WORKER_NODE_NAME}.kubeconfig
done
