#!/bin/bash

# set -x
# az login
rm -f *.tfstate*
rm -rf .terraform*
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
