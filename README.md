# Managing Multiple Namespaces with a Single ALB

This guide outlines the steps to use this repository for provisioning resources for managing multiple namespaces with a single AWS Application Load Balancer (ALB) on EKS. It will provision the necesarry resources like EKS, IAM and OIDC , Ingress Controller setup via Terraform. And inside the k8s-manifest directory you will get the manifests file for the kubernetes objects.

## Prerequisites

- AWS CLI installed and configured.
- Terraform installed.
- `kubectl` installed.
- Ensure `make` is installed on your system.

## Steps

### 1. Configure AWS Credentials and then Navigate to the `100infra` directory to run terraform

```bash
cd 100infra
terraform init
terraform apply
```
### 2. Deploy ALB Ingress Controller
```bash
cd ../200devops-tools
aws eks --region <region> update-kubeconfig --name <cluster-name>
terraform init
terraform apply
```

### 3. Deploy Kubernetes Manifests
```bash
cd ../k8-manifests
make deploy
```

### For Deleting Kubernetes objects 
```bash
kubectl delete -f namespace.yaml
