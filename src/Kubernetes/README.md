# Kubernetes

- Kubernetes is like docker-compose for multiple machines where we run our app. Every Worker Node represents a host/vm instance that contains Pod(container) + Proxy/Config (server) and a Master Node who manage these workers. This forms a Cluster. This Master Node can replicate Cloud provider API such as AWS, Azure etc.. for platform specific setup to run containers on them.

## Concept

- You still need to create the Cluster that has the Master Node/Controller and Worker Nodes that contains pod + Proxy.
- Kubernetes **will** orchestrate **DEPLOYED** images from a registry i.e. `DockerHub`, to run the `Pod` - containers, monitor pods and scale the pods accordingly. That being said, you still need the image for building the app logic.
- Kubernetes **will NOT** create this infrastructure for us.

```mermaid
    graph LR
    subgraph "Cluster - on data center i.e. Cloud"
    A[Master Node<br>Controller Plane for Pod]
    B[Worker Node:Host/VM<br>Proxy/Config<br>Pod:Container]
    C[Worker Node:Host/VM<br>Proxy/Config<br>Pod:Container]
    D[Worker Node:Host/VM<br>Proxy/Config<br>Pod:Container]
    A ---> B
    B --- C --- D
    end
    subgraph "Kubectl - Local host"
    E[kubectl]
    E ---> A
    end
```

- **Master Node**: `API` for kubelets, `Scheduler` watcher for Pods, `Kube-Controller-Manager` and `Cloud-Controller-manager` for interacting with Cloud Providers
- **Worker Node**: Consist of all the tools for running a container/containers. Docker is required, and `kubelet`, the connection for Master Node to Worker Nodes. `Kube-proxy`, managing incoming & outcoming Pod network.

## Architecture - How Kubernetes Manage Pods

- Kubernetes works with Objects - Pods, Deployments, Services, Volume
  - **Pod**: Run one or multiple containers. A pod is just a wrapper for container that is managed by Kubernetes.
  - **Deployment**: This key object is where we define numbers of pods and containers it should create and manage for you. Kubernetes will place pods on worker nodes - creating these pods - starting the containers. We don't have to manually pick remote hosts. Deployment will restart the pod if crashes.
    - can start, stop and rollback
    - Dynamic scaling for pods, i.e. high inc. traffic = creating more instances of pods, less traffic = remove unnecessary pods.
      - This ensures high availability and balancing the traffic spikes
  - **Service**: This object group Pods together with a shared IP for communication.
    - internal -> `--type=ClusterIP` only reachable inside cluster.
    - external --> `--type=NodePort` expose IP of the running worker node.
    - external --> `--type=LoadBalancer` evenly distribute inc. traffic, works if Cloud supports it.
    - Port --> `--port=YourAppPort`

| NAME        | TYPE       | CLUSTER-IP   | EXTERNAL-IP | PORT(S)        | AGE |
|-------------|------------|--------------|-------------|----------------|-----|
| kub-example | NodePort   | 10.96.240.54 | <none>      | 8080:31635/TCP | 6s  |
| kubernetes  | ClusterIP  | 10.96.0.1    | <none>      | 443/TCP        | 44h |

- EXTERNAL-IP would be available if provided by a cloud provider.
- We don't create pods, but deployment object as instructions so Kubernetes will manage this for us.

---

## Tools

- Kubectl - CLI tool for cluster instructions, i.e. new deployment, pod state etc.
  - Cluster is the infrastructure
  - Kubectl is the tool for managing this infrastructure
  - Master Node applies instructions to pods.
- Minikube - Setting up a dummy Cluster on local machine inside a VM to simulate another machine for testing application.

## Example of imperative workflow

1. Build the Image `docker build -t kub-example .`
2. Create the repo in Dockerhub, retag with repo e.g `docker tag kub-example sparrow/kub-example` and push to repo `docker push sparrow/kub-example`
3. Then use kubectl to create the `Deployment` object `kubectl create deployment first-kub-app --image=sparrow/kub-example`
    - Check deployment status `kubectl get deployment`
    - Check pods status `kubectl get pods`
4. Create service object `kubectl expose deployment first-kub-app --type=LoadBalancer --port=8080`
    - Check services status `kubectl get services`
    - Expose the IP from minikube `minikube service first-kub-app`
5. To manual create more instances `kubectl scale deployment/kub-first-kub-app --replicas=3` 3 more pods are created.
6. To update source code:
    - build new version tag `docker build -t first-kub-app:v2 .`
    - push to registry `docker push sparrow/first-kub-app:v2`
    - set current cluster image to the new tag `kubectl set image deployment/kub-first-app kub-first-app=sparrow/kub-first-app:v2`
    - Check status `kubectl rollout status deployment/kub-example`
7. To rollback latest change `kubectl rollout undo deployment/kub-first-app:v2`
    - Get history `kubectl rollout history deployment/kub-example`
    - rollout history to specific image `kubectl rollout history`, using flag `--revision=NUMBER`
    - Rollout to revision 1, `kubectl rollout undo deployment/first-kub-app --to-revision=1`
8. Get the dashboard `minikube dashboard` for the cluster meta.


## Example of declarative using config

1. Create config.yml file, then apply with `kubectl apply -f=config.yml`
2. These config files are Deployment, Service etc..
3. Update src code by adjusting change in .yml and re-apply.
4. Delete by `kubectl delete -f=*.yml -f=*.yml`

---

## Install

## [Kubectl]("https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/") Controller with cmd for cluster instructions

- Installation using [Chocolatey]("https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/#install-nonstandard-package-tools")

## [Minikube]("https://minikube.sigs.k8s.io/docs/start/") for testing Cluster on Host

- Creates a dummy cluster in VM on localhost for testing.
- This cluster contains Master Node and Worker Nodes.
- Installation with [Docker]("https://minikube.sigs.k8s.io/docs/drivers/docker/") as driver
- Then run `minikube start --driver=docker`, check the cluster with `minikube status`. Once this Cluster is up, we can use kubectl to communicate with this dummy cluster.
- Bring up the dashboard `minikube dashboard` to see the running cluster.

---
