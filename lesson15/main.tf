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

# # Получаем данные о сети lesson15-network-1
# module "network-1" {
#     source = "./modules/data_vpc"

#     vpc_name = "lesson15-network-1"
# }

# # Получаем о данные о сети var.selected_network = lesson15-network-2
# module "network-2" {
#     source = "./modules/data_vpc"

#     vpc_name = var.selected_network
# }

# # Создаем первую машину в сети lesson15-network-1
# module "vm-1" {
#     source = "./modules/create_vm"

#     zone = "ru-central1-a"
#     subnet = module.network-1.subnet_info
#     VPC = module.network-1.vpc_name
# }

# # Создаем вторую машину в сети lesson15-network-1
# module "vm-2" {
#     source = "./modules/create_vm"
    
#     zone = "ru-central1-b"
#     subnet = module.network-1.subnet_info
#     VPC = module.network-1.vpc_name
    
# }

# # Создаем первую машину в сети lesson15-network-2
# module "vm-3" {
#     source = "./modules/create_vm"

#     zone = "ru-central1-a"
#     subnet = module.network-2.subnet_info
#     VPC = module.network-2.vpc_name
# }

# # Создаем вторую машину в сети lesson15-network-2
# module "vm-4" {
#     source = "./modules/create_vm"
    
#     zone = "ru-central1-b"
#     subnet = module.network-2.subnet_info
#     VPC = module.network-2.vpc_name
# }