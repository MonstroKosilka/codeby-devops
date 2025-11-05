terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = var.zone
}

data "yandex_vpc_subnet" "subnets" {
  for_each = toset(var.subnet)
  subnet_id       = each.value

}
# Найти первую подсеть, подходящую указанной зоне
locals {
  matched_subnet_id = (
    [for subnet in data.yandex_vpc_subnet.subnets :
      subnet.subnet_id if subnet.zone == var.zone]
  )[0] # Берем первую подходящую подсеть
}

resource "yandex_compute_instance" "vm-create" {
    name = "module-create-vm-${var.zone}-${var.VPC}"
    platform_id = "standard-v3"
    zone = var.zone

    resources {
      cores = 2
      memory = 2
    }

    boot_disk {
      initialize_params {
        image_id = "fd8afra9ojd21ihubhn2"
        size = 10
      }
    }

    network_interface {
      nat = true
      subnet_id = local.matched_subnet_id
    }
}