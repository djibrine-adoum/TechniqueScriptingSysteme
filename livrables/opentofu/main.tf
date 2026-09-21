terraform {
  required_version = ">= 1.6"

  required_providers {
    multipass = {
      source  = "larstobi/multipass"
      version = "~> 1.4"
    }
  }
}

provider "multipass" {}

locals {
  cloud_init = "${path.module}/cloud-init"

  machines = {
    bastion = { cpus = 1, memory = "1GiB", disk = "5GiB", init = "bastion.yaml" }
    app     = { cpus = 1, memory = "2GiB", disk = "10GiB", init = "node.yaml" }
    monitor = { cpus = 1, memory = "2GiB", disk = "10GiB", init = "node.yaml" }
  }
}

resource "multipass_instance" "lab" {
  for_each = local.machines

  name           = each.key
  image          = "24.04"
  cpus           = each.value.cpus
  memory         = each.value.memory
  disk           = each.value.disk
  cloudinit_file = "${local.cloud_init}/${each.value.init}"

}
