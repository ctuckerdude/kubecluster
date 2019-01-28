variable "access_key" {
description = "AWS access key"
default = "AKIAJEMNMR2UOOT6NT4Q"
}

variable "secret_key" {
description = "AWS secret key"
default = "Bm3wiTLAtLQ9JQ/1zU2mjUuM2vlAobLQgiEcWRqr"
}

variable "region" {
description = "AWS region for hosting our your network"
default = "us-west-2"
}

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = "string"
}