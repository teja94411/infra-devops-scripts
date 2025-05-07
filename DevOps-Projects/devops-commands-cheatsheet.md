# 🛠️ DevOps Tools CLI Cheat Sheet

## 🔍 SonarQube (with Scanner)

```bash
# Analyze a project using SonarQube Scanner
sonar-scanner \
  -Dsonar.projectKey=<project-key> \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=<token>

# Scan with Maven
mvn clean verify sonar:sonar \
  -Dsonar.projectKey=<project-key> \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=<token>
```

---

## 🛡️ Trivy (Security Scanning)

```bash
# Scan a Docker image
trivy image nginx:latest

# Scan a local filesystem
trivy fs .

# Scan Kubernetes cluster (requires kubeconfig)
trivy k8s cluster

# Scan Git repo
trivy repo https://github.com/<user>/<repo>

# Scan Terraform files
trivy config --severity HIGH,CRITICAL ./terraform
```

---

## 🚀 Argo CD (GitOps for K8s)

```bash
# Login to Argo CD
argocd login <ARGOCD_SERVER> --username admin --password <password>

# Add Kubernetes cluster
argocd cluster add <context-name>

# Create new Argo CD app
argocd app create <app-name> \
  --repo https://github.com/<user>/<repo> \
  --path <path> \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace <namespace>

# Sync app with Git
argocd app sync <app-name>

# List apps
argocd app list

# Get app status
argocd app get <app-name>

# Delete app
argocd app delete <app-name> --cascade
```

---

## 🔄 GitOps (General Pattern)

```bash
# Commit code to Git
git add .
git commit -m "Update Helm values"
git push origin main

# ArgoCD/FluxCD watches Git → triggers K8s deployment

# Set up Webhook (e.g. GitHub → Argo CD or Flux)
# GitOps = Git is the source of truth
```

---

## 🧬 Git (Version Control)

```bash
git init                                 # Initialize repo
git clone <repo-url>                     # Clone a repo
git status                               # View file status
git add .                                # Stage all changes
git commit -m "Message"                  # Commit staged changes
git push origin main                     # Push to remote repo
git pull origin main                     # Pull latest from remote
git log                                  # View commit history
git checkout -b feature/new-feature      # Create new branch
git merge feature/new-feature            # Merge a branch into current
```

---

## 📈 Prometheus (Monitoring)

```bash
# Install via Helm
helm install prometheus prometheus-community/prometheus

# Access Prometheus UI
kubectl port-forward svc/prometheus-server 9090:80 -n <namespace>

# Prometheus CLI examples (query examples)
# These go into Prometheus UI:
up                                         # Show if targets are UP
node_cpu_seconds_total                     # Total CPU seconds used
rate(http_requests_total[1m])              # Request rate per second

# Configuration file: prometheus.yml
# Contains scrape_configs for targets
```

---

## 📊 Grafana (Dashboard & Visualization)

```bash
# Install via Helm
helm install grafana grafana/grafana --namespace monitoring --create-namespace

# Get admin password
kubectl get secret grafana -n monitoring -o jsonpath="{.data.admin-password}" | base64 --decode

# Port-forward to access UI
kubectl port-forward svc/grafana 3000:80 -n monitoring

# Default login: admin / <retrieved-password>

# Configure datasource: Prometheus (in Grafana UI)
# Import dashboard: JSON or ID from Grafana Dashboard hub
```

---

✅ These tools are essential for Cloud & DevOps workflows: from code analysis (SonarQube, Trivy), to CI/CD GitOps (Argo CD, Git), to monitoring and visualization (Prometheus, Grafana).

Would you like these commands combined into a single GitHub-ready DevOps toolkit repo template?
