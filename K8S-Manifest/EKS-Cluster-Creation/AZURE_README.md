## ☁️ Azure AKS Cluster Creation Using CLI

This section outlines how to create an Azure Kubernetes Service (AKS) cluster using the Azure CLI.

### Prerequisites
- [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Install `kubectl`](https://kubernetes.io/docs/tasks/tools/)
- Azure subscription with permission to create resources
- Logged into Azure using `az login`

### Step-by-Step

1. **Login to Azure**
   ```bash
   az login
   ```
   [Azure CLI Login Docs](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli)

2. **Create a Resource Group**
   ```bash
   az group create --name myResourceGroup --location eastus
   ```
   [Create Resource Group Docs](https://learn.microsoft.com/en-us/cli/azure/group#az-group-create)

3. **Create AKS Cluster**
   ```bash
   az aks create \
     --resource-group myResourceGroup \
     --name myAKSCluster \
     --node-count 2 \
     --enable-addons monitoring \
     --generate-ssh-keys
   ```
   - `--enable-addons monitoring` adds Azure Monitor for containers.
   - `--generate-ssh-keys` automatically creates SSH keys if not present.

   [AKS CLI Docs](https://learn.microsoft.com/en-us/cli/azure/aks)

4. **Get AKS Credentials for kubectl**
   ```bash
   az aks get-credentials --resource-group myResourceGroup --name myAKSCluster
   ```
   [Get Credentials Docs](https://learn.microsoft.com/en-us/cli/azure/aks#az-aks-get-credentials)

5. **Test Access**
   ```bash
   kubectl get nodes
   ```
   [kubectl Reference](https://kubernetes.io/docs/reference/kubectl/)

---

✅ **Next Steps:**
- Use [Azure Kubernetes Dashboard](https://learn.microsoft.com/en-us/azure/aks/kubernetes-dashboard) for GUI-based management
- Set up [RBAC](https://learn.microsoft.com/en-us/azure/aks/manage-azure-rbac) for access control
- Explore GitOps and CI/CD with [Azure DevOps](https://learn.microsoft.com/en-us/azure/devops/)

