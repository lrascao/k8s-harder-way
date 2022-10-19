./kubelet \
  --config=../../config/kubelet/kubelet-config.yaml \
  --container-runtime-endpoint=unix:///../../run/containerd/containerd.sock \
  --kubeconfig=../../config/kubelet/worker1.kubeconfig \
  --cgroup-root \
  --v=2
