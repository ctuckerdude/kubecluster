#!/bin/bash

# Time Sync
sudo ntpdate pool.ntp.org

# Initialise Terraform
terraform init

# Setup network and Kubernetes Cluster.
terraform plan -out eksterraform.tfplan
terraform apply eksterraform.tfplan

# Generate Kubernetes Config.
terraform output kubeconfig > eksconfig
export KUBECONFIG=eksconfig

# Setup Kubernetes Configuration to Join Worker Nodes.
terraform output config_map_aws_auth > config_map_aws_auth.yaml
kubectl apply -f config_map_aws_auth.yaml

# Install Kubernetes Dashboard.
bash install_kubernetes_dashboard.sh

# Add Admin Cluster Role to Anon User
kubectl create clusterrolebinding NAME --clusterrole=cluster-admin --user=system:anonymous

