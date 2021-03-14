# Define the configuration for our virtual machine for terraform

resource "digitalocean_droplet" "iac-hello-world-vm" {
  image              = "ubuntu-18-04-x64"
  name               = "iac-hello-world-vm"
  region             = "tor1"
  size               = "s-1vcpu-1gb"
  private_networking = true
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }
}
