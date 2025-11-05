output "subnets_ids" {
    description = "Информация о подсети"
    value = {
    for key, subnet in data.yandex_vpc_subnet.subnets : 
    key => {
      name             = subnet.name
      zone             = subnet.zone
      description      = subnet.description
      v4_cidr_blocks   = subnet.v4_cidr_blocks
    }
  }
}

output "subnet_info" {
    value = data.yandex_vpc_network.selected.subnet_ids
}

output "vpc_name" {
    value = data.yandex_vpc_network.selected.name
}