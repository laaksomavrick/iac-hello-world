#!/bin/sh

source .env && \
cd terraform && \
terraform plan -destroy -out=terraform.tfplan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/ioc-hello-world"