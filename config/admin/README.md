kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=../../certs/CA/ca.pem \
    --embed-certs=true \
    --server=https://kubernetes.home:6443 \
    --kubeconfig=admin.kubeconfig

kubectl config set-credentials admin \
    --client-certificate=../../certs/admin/admin.pem \
    --client-key=../../certs/admin/admin-key.pem \
    --embed-certs=true \
    --kubeconfig=admin.kubeconfig

kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=admin \
    --kubeconfig=admin.kubeconfig

kubectl config use-context default --kubeconfig=admin.kubeconfig
