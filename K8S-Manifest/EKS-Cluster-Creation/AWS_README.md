# Kubernetes Cluster Creation via CLI

This guide provides step-by-step instructions to create Kubernetes clusters using the Command Line Interface (CLI) on **Amazon EKS** (AWS) and **Azure AKS**.

---

## 🚀 Amazon EKS (AWS) Cluster Creation Using CLI

### Prerequisites
- [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [Install `eksctl`](https://eksctl.io/introduction/#installation)
- IAM permissions to create EKS clusters, VPCs, IAM roles, and EC2 nodes
- [Install `kubectl`](https://kubernetes.io/docs/tasks/tools/)

### Step-by-Step

1. **Configure AWS CLI**
   ```bash
   aws configure
   # Enter AWS Access Key, Secret, Region, Output Format
   ```
   [AWS Configure Docs](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

2. **Create EKS Cluster using `eksctl`**
   ```bash
   eksctl create cluster \
     --name my-eks-cluster \
     --region us-west-2 \
     --nodegroup-name standard-workers \
     --node-type t3.medium \
     --nodes 2 \
     --nodes-min 1 \
     --nodes-max 3 \
     --managed
   ```
   [EKS Cluster Creation Guide](https://eksctl.io/usage/creating-and-managing-clusters/)

3. **Verify Cluster is Running**
   ```bash
   aws eks list-clusters
   ```
   [AWS EKS CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/eks/list-clusters.html)

4. **Update kubeconfig**
   ```bash
   aws eks update-kubeconfig --region us-west-2 --name my-eks-cluster
   ```
   [Update kubeconfig Docs](https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html)

5. **Test Access**
   ```bash
   kubectl get nodes
   ```
   [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

---

✅ **Next Steps:**
- Deploy applications to your cluster
- Use Helm for package management: [Helm.sh](https://helm.sh/)
- Secure your cluster with RBAC and IAM roles

