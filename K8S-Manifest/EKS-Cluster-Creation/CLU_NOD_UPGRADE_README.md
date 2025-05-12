# Kubernetes Cluster and Node Upgrade Guide

This guide provides instructions for upgrading Kubernetes **clusters** and **nodes** on both **Amazon EKS (AWS)** and **Azure AKS (Azure)**, including **CLI-based commands** and **UI methods**.

---

## 🚀 Upgrading Amazon EKS (AWS) Cluster and Nodes

### 🔧 Cluster Upgrade using AWS CLI

#### Prerequisites
- Ensure you have `eksctl` and `kubectl` installed.
- Backup your applications and data.
- Ensure your **IAM role** has sufficient permissions.

#### Steps to Upgrade EKS Cluster

1. **Check the current cluster version**:
   ```bash
   eksctl utils describe-stacks --region <region> --cluster <cluster-name>
   ```

2. **Upgrade the EKS Cluster**:
   You can upgrade the cluster to a newer version using `eksctl`:
   ```bash
   eksctl upgrade cluster \
     --name my-eks-cluster \
     --region us-west-2 \
     --kubernetes-version <new-version>
   ```
   You can check available versions using:
   ```bash
   aws eks describe-cluster --name <cluster-name> --query "cluster.version"
   ```

3. **Update kubeconfig** (if necessary):
   ```bash
   aws eks update-kubeconfig --region us-west-2 --name my-eks-cluster
   ```

#### Steps to Upgrade EKS Node Group

1. **List Node Groups**:
   ```bash
   eksctl get nodegroup --cluster my-eks-cluster --region us-west-2
   ```

2. **Upgrade Node Group**:
   ```bash
   eksctl upgrade nodegroup \
     --cluster my-eks-cluster \
     --region us-west-2 \
     --name <nodegroup-name> \
     --kubernetes-version <new-version> \
     --approve
   ```

3. **Verify Node Upgrade**:
   After upgrading, verify the node version:
   ```bash
   kubectl get nodes
   ```

📘 [AWS EKS Cluster Upgrade Docs](https://docs.aws.amazon.com/eks/latest/userguide/update-cluster.html)  
📘 [AWS EKS Node Group Upgrade Docs](https://docs.aws.amazon.com/eks/latest/userguide/update-node-group.html)

---

### 🖥️ Upgrading EKS Cluster and Node Group Using AWS Management Console (UI)

#### Steps to Upgrade Cluster

1. Go to the [EKS Console](https://console.aws.amazon.com/eks/).
2. Select your cluster.
3. Under the **Cluster Version** section, click **Update**.
4. Choose the desired Kubernetes version and follow the wizard to apply the upgrade.

#### Steps to Upgrade Node Group

1. Go to the **Node Groups** section of your cluster.
2. Select the node group to upgrade.
3. Click **Edit** and select the new Kubernetes version.
4. Follow the UI prompts to upgrade the node group.

📘 [AWS EKS Console Guide](https://docs.aws.amazon.com/eks/latest/userguide/update-cluster.html)

---

## ☁️ Upgrading Azure AKS (Azure) Cluster and Nodes

### 🔧 Cluster Upgrade using Azure CLI

#### Prerequisites
- Ensure you have `az` CLI and `kubectl` installed.
- Ensure that you have the correct permissions.

#### Steps to Upgrade AKS Cluster

1. **Check current cluster version**:
   ```bash
   az aks show --resource-group <resource-group> --name <aks-cluster> --query "kubernetesVersion"
   ```

2. **Upgrade the AKS Cluster**:
   You can upgrade the AKS cluster to a newer version:
   ```bash
   az aks upgrade \
     --resource-group <resource-group> \
     --name <aks-cluster> \
     --kubernetes-version <new-version> \
     --yes
   ```

3. **Verify the Upgrade**:
   Once the upgrade is complete, check the version:
   ```bash
   kubectl version --short
   ```

#### Steps to Upgrade AKS Node Pool

1. **List Node Pools**:
   ```bash
   az aks nodepool list \
     --resource-group <resource-group> \
     --cluster-name <aks-cluster> \
     --out table
   ```

2. **Upgrade Node Pool**:
   ```bash
   az aks nodepool upgrade \
     --resource-group <resource-group> \
     --cluster-name <aks-cluster> \
     --name <nodepool-name> \
     --kubernetes-version <new-version> \
     --yes
   ```

3. **Verify Node Upgrade**:
   ```bash
   kubectl get nodes
   ```

📘 [Azure AKS Cluster Upgrade Docs](https://learn.microsoft.com/en-us/azure/aks/upgrade-cluster)  
📘 [Azure AKS Node Pool Upgrade Docs](https://learn.microsoft.com/en-us/azure/aks/upgrade-nodepool)

---

### 🖥️ Upgrading AKS Cluster and Node Pool Using Azure Portal (UI)

#### Steps to Upgrade Cluster

1. Go to the [Azure Portal](https://portal.azure.com/).
2. Navigate to **Kubernetes Services** > Select the AKS cluster.
3. In the **Overview** page, click on **Upgrade**.
4. Choose the Kubernetes version and confirm the upgrade.

#### Steps to Upgrade Node Pool

1. In the **Node Pools** section, select the node pool.
2. Click on **Upgrade** to select the desired version.

📘 [Azure Portal AKS Upgrade Guide](https://learn.microsoft.com/en-us/azure/aks/upgrade-cluster)

---

## 🔄 Comparison: EKS vs AKS Cluster & Node Upgrade

| Feature                       | Amazon EKS                                      | Azure AKS                                      |
|-------------------------------|-------------------------------------------------|------------------------------------------------|
| **Cluster Upgrade**            | `eksctl upgrade cluster` or AWS Console         | `az aks upgrade` or Azure Portal              |
| **Node Pool Upgrade**          | `eksctl upgrade nodegroup` or AWS Console       | `az aks nodepool upgrade` or Azure Portal     |
| **Upgrade Kubernetes Version** | Can upgrade to a specific Kubernetes version   | Can upgrade to a specific Kubernetes version  |
| **Rollout Upgrade**            | Managed rolling update, handles node replacement | Managed rolling update, handles node replacement|
| **Rollback**                   | Limited ability to rollback                    | Limited ability to rollback                   |
| **UI Support**                 | Full UI support in AWS Console                  | Full UI support in Azure Portal               |

---

## ✅ Notes:
- **Backups**: Always ensure your data is backed up before upgrading clusters or nodes.
- **Compatibility**: Verify that your applications are compatible with the new Kubernetes version before upgrading.
- **Downtime**: During upgrades, there may be temporary downtime, so plan upgrades accordingly in production environments.
- **Version Support**: Both AWS EKS and Azure AKS support specific Kubernetes versions, so check compatibility with your workloads.

