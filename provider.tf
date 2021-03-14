# Define the configuration for the digital ocean provider for terraform

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "1.22.2"
    }
  }
}

# Declare some variables - these will be passed in at runtime from our .env
# do_token is the digital ocean access token
# pvt_key is our ssh key which will let us log in
variable "do_token" {}
variable "pvt_key" {}

# associate our token from our .env via the variable to the digital ocean provider 
provider "digitalocean" {
  token = var.do_token
}

# have terraform automagically add our ssh key to the created droplets
# mine is iac-hello-world via digitalocean's console
data "digitalocean_ssh_key" "terraform" {
  name = "iac-hello-world"
}
