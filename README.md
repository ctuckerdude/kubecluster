# KubeCluster
The KubeCluster project contains a set of Terraform, https://www.terraform.io, 
scripts which provision a Kubernetes Cluster to Amazon EKS. 

The provisioning includes:
* Admin Cluster Role Bindings Creation
* Admin Service Account Creation 
* Kubernetes Worker Configuration
* Network Configuration
* Installation of Kubernetes Dashboard UI Console.

The scripts implemented in this project were derived from a number of sources, some of which are listed below:
1. Managing Kubernetes Applications With Hashicorp Terraform 
https://www.hashicorp.com/blog/managing-kubernetes-applications-with-hashicorp-terraform

2. Hashicorp Kubernetes Provider
https://www.terraform.io/docs/providers/kubernetes/index.html

3. Kubernetes Dashboard
https://github.com/kubernetes/dashboard/wiki/Accessing-Dashboard---1.7.X-and-above#kubectl-proxy

**Prerequisites**
In order for the scripts to run the host must contain the serveral packages, see below (Centos 7).

1. Terraform Install
sudo yum install -y zip unzip (if these are not installed)
wget https://releases.hashicorp.com/terraform/0.9.8/terraform_0.9.8_linux_amd64.zip
unzip terraform_0.9.8_linux_amd64.zip
sudo mv terraform /usr/local/bin/
Confirm terraform binary is accessible: terraform --version


2. KubeCtl Install
curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

wget https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
sudo mv ./kubectl /usr/local/bin/aws-iam-authenticator

3. AWS CLI Install
https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html

curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws


**How to Run The Scripts**

The scripts are run using admin user (not root):
bash deploy.sh

Ensure when you have finished to remove the KubeCluster from Amazon EKS using
terraform destroy and then check the EKS account to ensure all resources have been
removed to avoid being charged.

**Kubernetes Dashboard UI Console**

On completion of the KubeCluster provisioning, a kubernetes_dashboard_token.dat file
is generated. This file contains a token which is used to login to the Kubernetes 
Dashboard. The Daskboard can be accessed from the following url:

https://<Master IP>/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login

Where <Master IP> is found clusters: cluster: server in the generated file eksconfig file.


 

