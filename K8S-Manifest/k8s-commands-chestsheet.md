# 🧠 Kubernetes (kubectl) Command Cheat Sheet — With Definitions

```bash
# 🔧 CONFIGURATION COMMANDS
kubectl version                                      # Show the Kubernetes client and server versions
kubectl config view                                  # Display kubeconfig settings
kubectl config get-contexts                          # List all configured contexts (clusters)
kubectl config use-context <context-name>            # Switch to a different Kubernetes context
kubectl config current-context                       # Show the current context

# 📦 POD COMMANDS
kubectl get pods                                     # List all pods in the current namespace
kubectl get pods -n <namespace>                      # List pods in a specific namespace
kubectl describe pod <pod-name>                      # Detailed information about a specific pod
kubectl logs <pod-name>                              # Fetch logs from a pod
kubectl logs <pod-name> -c <container-name>          # Fetch logs from a specific container in a pod
kubectl exec -it <pod-name> -- /bin/bash             # Access the shell inside a running pod
kubectl delete pod <pod-name>                        # Delete a specific pod

# 🧱 DEPLOYMENT COMMANDS
kubectl get deployments                              # List all deployments
kubectl describe deployment <name>                   # Show details of a deployment
kubectl create deployment <name> --image=<image>     # Create a deployment using an image
kubectl scale deployment <name> --replicas=3         # Scale the deployment to 3 replicas
kubectl edit deployment <name>                       # Edit a deployment resource in-place
kubectl delete deployment <name>                     # Delete a deployment
kubectl rollout status deployment/<name>             # Check the status of a rollout
kubectl rollout undo deployment/<name>               # Rollback to previous deployment version

# 📁 YAML FILES
kubectl apply -f <file.yaml>                         # Create or update resources from a YAML file
kubectl create -f <file.yaml>                        # Create resources defined in a YAML file
kubectl delete -f <file.yaml>                        # Delete resources defined in a YAML file
kubectl diff -f <file.yaml>                          # Show differences between live config and YAML

# 🔁 REPLICASETS
kubectl get rs                                       # List ReplicaSets
kubectl describe rs <rs-name>                        # Detailed info about a ReplicaSet

# 📂 SERVICES
kubectl get svc                                      # List services
kubectl describe svc <svc-name>                      # Service details
kubectl expose deployment <name> --type=NodePort --port=80    # Expose a deployment as a service

# 📦 CONFIGMAP & SECRETS
kubectl create configmap <name> --from-literal=key=value      # Create a ConfigMap from literal
kubectl get configmaps                                        # List ConfigMaps
kubectl describe configmap <name>                             # Details of a ConfigMap

kubectl create secret generic <name> --from-literal=key=value # Create a Secret from literal
kubectl get secrets                                           # List secrets
kubectl describe secret <name>                                # Secret details

# 🧠 NAMESPACES
kubectl get namespaces                               # List all namespaces
kubectl create namespace <name>                      # Create a new namespace
kubectl delete namespace <name>                      # Delete a namespace

# 🌐 NODES
kubectl get nodes                                    # List all cluster nodes
kubectl describe node <node-name>                    # Show details of a node
kubectl cordon <node-name>                           # Mark a node as unschedulable
kubectl drain <node-name> --ignore-daemonsets        # Safely evict all pods from the node
kubectl uncordon <node-name>                         # Mark a node as schedulable again

# 📤 JOBS & CRONJOBS
kubectl create job <name> --image=<image>            # Create a new job
kubectl get jobs                                     # List jobs
kubectl get cronjobs                                 # List cron jobs
kubectl create -f <cronjob.yaml>                     # Create cron job from YAML

# 🔍 INSPECTION & DEBUGGING
kubectl top pod                                      # Show resource usage of pods (metrics-server required)
kubectl top node                                     # Show resource usage of nodes
kubectl describe <resource> <name>                   # Show detailed information about a resource
kubectl get all                                      # List all resources in current namespace

# 🎯 LABELS & ANNOTATIONS
kubectl label pod <pod-name> key=value               # Add a label to a pod
kubectl annotate pod <pod-name> key=value            # Add an annotation to a pod
kubectl get pods --show-labels                       # List pods with labels

# 🧹 CLEANUP COMMANDS
kubectl delete pod <pod-name>                        # Delete a pod
kubectl delete deployment <name>                     # Delete a deployment
kubectl delete svc <name>                            # Delete a service
kubectl delete configmap <name>                      # Delete a ConfigMap
kubectl delete secret <name>                         # Delete a secret
kubectl delete namespace <name>                      # Delete a namespace

# 📘 CUSTOM RESOURCE DEFINITIONS (CRDs)
kubectl get crds                                     # List all CRDs
kubectl describe crd <name>                          # CRD details

# 🧪 TESTING
kubectl run test-pod --rm -it --image=alpine -- /bin/sh   # Run an interactive test pod

```
