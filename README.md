
Install client tools

* cfssl (https://github.com/cloudflare/cfssl.git) v1.6.3
    * `make`
    * cp src/cfssl/bin/* bin/cfssl
* etcd (git@github.com:etcd-io/etcd.git) v3.5.5
    * `make`
    * `cp bin/etcd ../../bin/etcd/`
    * `cp bin/etcdctl ../../bin/etcd/`
* kubernetes (https://github.com/kubernetes/kubernetes.git) v1.25.3
    * `make WHAT=cmd/kubectl`
    * cp _output/local/bin/darwin/amd64/kubectl ../../bin/kubernetes
    * `make WHAT=cmd/kube-apiserver`
    * cp _output/local/bin/darwin/amd64/kube-apiserver ../../bin/kubernetes/
    * `make WHAT=cmd/kube-controller-manager`
    * cp _output/local/bin/darwin/amd64/kube-controller-manager ../../bin/kubernetes/
    * `make WHAT=cmd/kube-scheduler`
    * cp _output/local/bin/darwin/amd64/kube-scheduler ../../bin/kubernetes/
    * `make WHAT=cmd/kube-proxy`
    * cp _output/local/bin/darwin/amd64/kube-proxy ../../bin/kubernetes/
    * `make WHAT=cmd/kubelet`
    * cp _output/local/bin/darwin/amd64/kubelet ../../bin/kubernetes/


