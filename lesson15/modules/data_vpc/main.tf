terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = var.default_zone
}

data "yandex_vpc_network" "selected" {
    name = var.vpc_name
}

data "yandex_vpc_subnet" "subnets" {
  for_each = toset(data.yandex_vpc_network.selected.subnet_ids)
  subnet_id = each.value
}

