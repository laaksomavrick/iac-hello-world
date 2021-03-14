#!/bin/sh

source .env && \
cd terraform && \
terraform apply \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/iac-hello-world"