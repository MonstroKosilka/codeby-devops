output "internal_ip_address_public_vm" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "external_ip_address_public_vm" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "internal_ip_address_private_vm" {
  value = yandex_compute_instance.vm-2.network_interface.0.ip_address
}

output "external_ip_address_private_vm" {
  value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}