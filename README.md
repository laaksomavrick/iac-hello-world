# IaC hello world

The goal of this repository is to serve as an example and living document of how to leverage infrastructure-as-code to 1) create a droplet in digitalocean and 2) configure it for usage with docker-compose. We'll be using `terraform` for the former and `ansible` for the latter.

## Creating the virtual machine (terraform)

The end result of this process will be a droplet running ubuntu in TOR1 via digitalocean

### Prerequisites
* An account with digitalocean
* A digitalocean personal access key
* A passwordless ssh key configured with digitalocean
* `terraform` CLI installed

### Creating a droplet

* configure `.env` from `.env.example`
* `source .env`
* `find scripts -type f -iname "*.sh" -exec chmod +x {} \;`
* `cd terraform && terraform init`
* `./scripts/tf-plan.sh`
* `./scripts/tf-apply.sh`
* `terraform show terraform.tfstate`

### Destroying the droplet

* `./script/tf-destroy.sh`
* `terraform apply terraform.tfplan`

## Configuring the virtual machine (ansible)

The end result of this process will be the aformentioned droplet running nginx via `docker` and `docker-compose` which should be accessible to the internet


### Prerequisites
* `ansible` installed
* a droplet available

###  Ansible setup
* `touch ~/.ansible/hosts`
* `vim ~/.ansible/hosts` and paste the following:

```
[servers]
iac-hello-world ansible_host=$YOUR_IP_HOST ansible_ssh_private_key_file=~/.ssh/iac-hello-world

[all:vars]
ansible_python_interpreter=/usr/bin/python3
```

Confirm configuration via:
* `ansible-inventory --list -y -i $ANSIBLE_HOSTS`

Confirm connection via:
* `ansible all -m ping -u root -i $ANSIBLE_HOSTS`

### Machine configuration

Run our playbook:

* `ansible-playbook ansible/playbook.yml -l iac-hello-world -u root -i $ANSIBLE_HOSTS`

To confirm, ssh into the machine via:
* `ssh -i ~/.ssh/iac-hello-world root@$YOUR_IP_HOST`

And then check to see if the container was successfully created:
* `docker ps -a`

And then check to see if we can connect to the machine (we should see the nginx welcome page)
* `http://$YOUR_IP_HOST:8080`