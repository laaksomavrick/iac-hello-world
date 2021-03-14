#!/bin/sh

source .env && \
cd ansible && \
ansible-playbook ansible/playbook.yml \
-l iac-hello-world \
-u root \
-i $ANSIBLE_HOSTS