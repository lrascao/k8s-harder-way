kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=../../certs/CA/ca.pem \
    --embed-certs=true \
    --server=https://kubernetes.home:6443 \
    --kubeconfig=kube-controller-manager.kubeconfig

kubectl config set-credentials system:kube-controller-manager \
    --client-certificate=../../certs/kube-controller-manager/kube-controller-manager.pem \
    --client-key=../../certs/kube-controller-manager/kube-controller-manager-key.pem \
    --embed-certs=true \
    --kubeconfig=kube-controller-manager.kubeconfig

kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:kube-controller-manager \
    --kubeconfig=kube-controller-manager.kubeconfig

kubectl config use-context default --kubeconfig=kube-controller-manager.kubeconfig
