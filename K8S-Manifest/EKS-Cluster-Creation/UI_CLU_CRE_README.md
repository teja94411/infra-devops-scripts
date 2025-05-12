# Kubernetes Cluster Creation via UI

This guide provides step-by-step instructions to create Kubernetes clusters using **Web Console (UI)** 

- 🚀 Amazon EKS (AWS)
- ☁️ Azure AKS (Azure)

### 🖥️ Using AWS Management Console (UI)

#### Step-by-Step

1. Go to the [Amazon EKS Console](https://console.aws.amazon.com/eks/home).
2. Click **"Add Cluster"** → **"Create"**.
3. Fill in:
   - **Cluster name**
   - **Kubernetes version**
   - **VPC and subnets**
   - **IAM role for EKS**
4. Click **"Next"** and create the control plane.
5. After the cluster is active, create a **Node Group**:
   - Choose instance type and count
   - Attach the appropriate IAM role
6. Once nodes are ready, use the AWS CLI to update kubeconfig:
   ```bash
   aws eks update-kubeconfig --region <your-region> --name <cluster-name>
   ```
7. Verify:
   ```bash
   kubectl get nodes
   ```

📘 [Official AWS EKS UI Guide](https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html)

---

## ☁️ Azure AKS (Azure) Cluster Creation

### 🔧 Using Azure CLI

#### Prerequisites
- [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Install `kubectl`](https://kubernetes.io/docs/tasks/tools/)
- Azure subscription and sufficient permissions


### 🖥️ Using Azure Portal (UI)

#### Step-by-Step

1. Go to the [Azure Portal](https://portal.azure.com/).
2. Navigate to **Kubernetes services** > Click **"Create"**.
3. Fill in:
   - **Cluster name**
   - **Region**
   - **Node pool settings**
   - **Authentication and networking**
4. Click **Review + Create**.
5. After deployment:
   - Click **"Connect"** on the cluster overview page
   - Run the `az aks get-credentials` command shown
6. Verify with:
   ```bash
   kubectl get nodes
   ```

📘 [Official Azure AKS UI Guide](https://learn.microsoft.com/en-us/azure/aks/kubernetes-walkthrough-portal)

---

## ✅ What's Next?
- Use [Helm](https://helm.sh/) to deploy applications on your cluster.
- Secure access using [RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/).
- Monitor with [AWS CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html) or [Azure Monitor](https://learn.microsoft.com/en-us/azure/azure-monitor/overview).
