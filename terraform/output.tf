output "nat-instance_nat_ip" {
  value = yandex_compute_instance.nat-instance.network_interface[0].nat_ip_address
}
output "vm_public_nat_ip" {
  value = yandex_compute_instance.vm-public.network_interface[0].nat_ip_address
}
output "vm_pivate_ip" {
  value = yandex_compute_instance.vm-private.network_interface[0].ip_address
}
