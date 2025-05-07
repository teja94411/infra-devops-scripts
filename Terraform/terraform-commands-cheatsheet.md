# 🌍 Terraform CLI Commands Cheat Sheet — With Simple Definitions

```bash
# ⚙️ SETUP & INITIALIZATION
terraform version                              # Check Terraform version
terraform init                                 # Initialize a working directory
terraform validate                             # Validate configuration files (syntax check)
terraform fmt                                   # Format Terraform files for readability
terraform providers                            # Show used providers in the config

# 🔍 PLAN & APPLY
terraform plan                                 # Preview changes before applying
terraform apply                                # Apply changes to infrastructure
terraform apply -auto-approve                  # Apply without asking for confirmation
terraform destroy                              # Destroy managed infrastructure
terraform destroy -auto-approve                # Destroy without confirmation
terraform output                                # Show output values
terraform output <name>                         # Show specific output value

# 📁 FILE STRUCTURE (TYPICAL)
# main.tf       → Core resource definitions
# variables.tf  → Input variables
# outputs.tf    → Output values
# terraform.tfvars → Actual variable values
# provider.tf   → Cloud provider setup

# 🗂 VARIABLES & TFVARS
terraform apply -var="region=us-east-1"        # Pass variable inline
terraform plan -var-file="dev.tfvars"          # Pass variable file
terraform apply -var-file="prod.tfvars"

# 🛠 RESOURCE TARGETING
terraform plan -target=aws_instance.web        # Plan only for a specific resource
terraform apply -target=aws_s3_bucket.mybucket # Apply only for one resource

# 🌎 WORKSPACE MANAGEMENT
terraform workspace list                       # List all workspaces
terraform workspace new dev                    # Create new workspace
terraform workspace select dev                 # Switch to workspace
terraform workspace delete dev                 # Delete workspace

# 🧹 CLEANUP
rm -rf .terraform                              # Remove Terraform working directory
rm terraform.tfstate*                          # Delete local state files (use with caution)

# 📂 BACKEND (REMOTE STATE)
# Defined in main.tf
terraform init -backend-config="config.tfbackend"  # Initialize with custom backend

# 🔐 STATE FILE COMMANDS
terraform state list                           # List all managed resources in state
terraform state show <resource>                # Show resource details from state
terraform state rm <resource>                  # Remove resource from state
terraform state mv <old> <new>                 # Rename/move resource in state

# ☁️ COMMON PROVIDERS
# AWS: provider "aws" { region = "us-east-1" }
# Azure: provider "azurerm" { features {} }
# GCP: provider "google" { project = "my-project" }

```
