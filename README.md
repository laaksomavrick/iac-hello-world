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
* `chmod +x scripts/tf-plan.sh`
* `chmod +x scripts/tf-apply.sh`
* `chmod +x scripts/tf-destroy.sh`
* `./scripts/tf-plan.sh`
* `./scripts/tf-apply.sh`
* `terraform show terraform.tfstate`

### Destroying the droplet

* `./script/tf-destroy.sh`
* `terraform apply terraform.tfplan`
