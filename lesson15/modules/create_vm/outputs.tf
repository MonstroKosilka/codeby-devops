output "vm_name" {
    value = yandex_compute_instance.vm-create.name
}

output "vm_id" {
    value = yandex_compute_instance.vm-create.id
}

output "internal_ip_address_public_vm" {
  value = yandex_compute_instance.vm-create.network_interface.0.ip_address
}

output "external_ip_address_public_vm" {
  value = yandex_compute_instance.vm-create.network_interface.0.nat_ip_address
}