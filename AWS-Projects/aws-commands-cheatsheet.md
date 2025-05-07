# ☁️ AWS CLI Commands Cheat Sheet — With Simple Definitions

```bash
# 🔧 CONFIGURATION
aws configure                                 # Set up access keys, region, and output format
aws configure list                            # View current configuration
aws configure get region                      # Get configured region
aws sts get-caller-identity                   # Verify IAM identity

# 🪣 S3 (Simple Storage Service)
aws s3 ls                                     # List all buckets
aws s3 ls s3://<bucket-name>/                 # List contents of a bucket
aws s3 mb s3://<bucket-name>                  # Make a new bucket
aws s3 rb s3://<bucket-name> --force          # Remove a bucket with contents
aws s3 cp file.txt s3://<bucket-name>/        # Upload file to bucket
aws s3 cp s3://<bucket-name>/file.txt .       # Download file from bucket
aws s3 sync ./local-dir s3://<bucket-name>/   # Sync local dir with bucket

# 🧠 IAM (Identity and Access Management)
aws iam list-users                            # List all IAM users
aws iam create-user --user-name <name>        # Create a new IAM user
aws iam delete-user --user-name <name>        # Delete IAM user
aws iam attach-user-policy                    \
  --user-name <name> \
  --policy-arn arn:aws:iam::aws:policy/<PolicyName>   # Attach policy to user

# 🖥 EC2 (Elastic Compute Cloud)
aws ec2 describe-instances                    # List all EC2 instances
aws ec2 start-instances --instance-ids <id>   # Start an EC2 instance
aws ec2 stop-instances --instance-ids <id>    # Stop an EC2 instance
aws ec2 reboot-instances --instance-ids <id>  # Reboot instance
aws ec2 terminate-instances --instance-ids <id> # Terminate instance
aws ec2 describe-key-pairs                    # Show key pairs
aws ec2 create-key-pair --key-name <name>     # Create key pair (prints private key)

# 📦 EBS (Elastic Block Store)
aws ec2 describe-volumes                      # List EBS volumes
aws ec2 create-volume --size 10 --availability-zone us-east-1a   # Create new volume
aws ec2 delete-volume --volume-id <id>        # Delete a volume

# 🌐 VPC (Virtual Private Cloud)
aws ec2 describe-vpcs                         # List all VPCs
aws ec2 create-vpc --cidr-block 10.0.0.0/16    # Create a VPC
aws ec2 delete-vpc --vpc-id <vpc-id>          # Delete a VPC

# 🚦 SECURITY GROUPS
aws ec2 describe-security-groups              # List security groups
aws ec2 create-security-group --group-name my-sg \
  --description "My security group" --vpc-id <vpc-id>   # Create SG
aws ec2 authorize-security-group-ingress \
  --group-id <sg-id> \
  --protocol tcp --port 22 --cidr 0.0.0.0/0    # Allow SSH access

# 🔄 AUTO SCALING
aws autoscaling describe-auto-scaling-groups  # List auto-scaling groups
aws autoscaling create-auto-scaling-group \
  --auto-scaling-group-name my-asg \
  --launch-configuration-name my-launch-config \
  --min-size 1 --max-size 3 \
  --vpc-zone-identifier subnet-xxxxxxxx         # Create ASG

# 🎯 ELB (Elastic Load Balancer)
aws elbv2 describe-load-balancers             # List load balancers
aws elbv2 create-load-balancer --name my-lb \
  --subnets subnet-123 subnet-456 \
  --security-groups sg-12345678                # Create load balancer

# 🔄 CLOUDFORMATION
aws cloudformation deploy \
  --template-file template.yaml \
  --stack-name mystack                         # Deploy CloudFormation stack

aws cloudformation delete-stack --stack-name mystack  # Delete a stack

# 📊 CLOUDWATCH
aws cloudwatch list-metrics                   # List CloudWatch metrics
aws cloudwatch get-metric-statistics          \
  --namespace AWS/EC2 \
  --metric-name CPUUtilization \
  --start-time 2024-05-01T00:00:00Z \
  --end-time 2024-05-07T00:00:00Z \
  --period 300 --statistics Average \
  --dimensions Name=InstanceId,Value=<instance-id>

# 🗂 LAMBDA
aws lambda list-functions                     # List all Lambda functions
aws lambda invoke                             \
  --function-name my-function \
  --payload file://input.json output.json     # Invoke Lambda

# 🗃 RDS (Relational Database Service)
aws rds describe-db-instances                 # List RDS instances
aws rds start-db-instance --db-instance-identifier mydb  # Start DB
aws rds stop-db-instance --db-instance-identifier mydb   # Stop DB

# 📍 ROUTE 53
aws route53 list-hosted-zones                 # List all hosted zones
aws route53 change-resource-record-sets       \
  --hosted-zone-id <zone-id> \
  --change-batch file://record-change.json     # Change DNS records

# 📁 ECR (Elastic Container Registry)
aws ecr get-login-password | docker login --username AWS --password-stdin <account>.dkr.ecr.<region>.amazonaws.com
aws ecr create-repository --repository-name my-app
aws ecr list-images --repository-name my-app
aws ecr delete-repository --repository-name my-app --force

```
