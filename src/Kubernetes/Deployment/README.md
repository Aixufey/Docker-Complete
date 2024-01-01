# K8s deployment

> AWS for Deployment EKS (Elastic Kubernetes Service) vs ECS (Elastic Container Service)

- EKS for Kubernetes
- ECS general Docker container

---

## EKS

- Setup an EKS [Cluster Role](https://docs.aws.amazon.com/eks/latest/userguide/service_IAM_role.html#create-service-role) to control Cluster
- Create a [EKS Cluster](https://aws.amazon.com/eks/), and assign the created Role to this cluster
- Create [CloudFormation](https://eu-north-1.console.aws.amazon.com/cloudformation/home#/getting-started) Stack, template for cloud provision
  - template [URL](https://docs.aws.amazon.com/eks/latest/userguide/creating-a-vpc.html#create-vpc)
- Download AWS CLI to configure `kubectl` on AWS and shift away from minikube.
- Setup an [ACCESS KEY](https://us-east-1.console.aws.amazon.com/iam/home#/security_credentials) from security credentials. Download the .csv file.
- Then inside CLI `aws configure` apply the data from .csv.
- Add the Worker Nodes -> Compute -> Node Group. Worker Node is basically running instances of EC2's. So we have to grant access and privileges. Create another EC2 [Worker Node Role](https://docs.aws.amazon.com/eks/latest/userguide/service_IAM_role.html#create-service-role)
  - with permission `AmazonEKSWorkerNodePolicy` `AmazonEKS_CNI_Policy` `AmazonEC2ContainerRegistryReadOnly`
  - Then add the IAM role to Worker Node.
- Inside Node Compute config - we can define the amount of Nodes (VMs) and their resources.
- **Update Cluster to AWS** `aws eks --region eu-north-1 update-kubeconfig --name kub-deploy-demo`
  - region: Your Cluster region
  - name: AWS EKS cluster name
