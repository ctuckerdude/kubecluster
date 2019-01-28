variable "access_key" {
description = "AWS access key"
default = "<Place Your Access Key Here>"
}

variable "secret_key" {
description = "AWS secret key"
default = "<Place YOur Secret Key Here>"
}

variable "region" {
description = "AWS region for hosting our your network"
default = "us-west-2"
}

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = "string"
}