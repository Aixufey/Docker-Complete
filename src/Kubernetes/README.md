# Kubernetes

- Kubernetes is like docker-compose for multiple machines where we run our app. Every Worker Node represents a host/vm instance that contains Pod(container) + Proxy/Config (server) and a Master Node who manage these workers. This forms a Cluster. This Master Node can replicate Cloud provider API such as AWS, Azure etc.. for platform specific setup to run containers on them.

- **Worker Node**: Consist of all the tools for running a container/containers. Docker is required, and `kubelet`, the connection for Master Node to Worker Nodes. `Kube-proxy`, managing incoming & outcoming Pod network.

-- **Master Node**: `API` for kubelets, `Scheduler` watcher for Pods, `Kube-Controller-Manager` and `Cloud-Controller-manager` for interacting with Cloud Providers

## [Kubectl]("https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/") Controller with cmd for cluster instructions

- Installation using [Chocolatey]("https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/#install-nonstandard-package-tools")

## [Minikube]("https://minikube.sigs.k8s.io/docs/start/") for testing Cluster on Host

- Creates a cluster in VM on local for testing
- Installation with [Docker]("https://minikube.sigs.k8s.io/docs/drivers/docker/") as driver
