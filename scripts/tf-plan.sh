#!/bin/sh

source .env && \
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/iac-hello-world"