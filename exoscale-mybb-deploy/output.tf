output "ipv4_address" {
  value = exoscale_compute_instance.mybb.public_ip_address
}

output "gateway_url" {
  description = "The url of the mybb gateway"
  value       = "http://${exoscale_compute_instance.mybb.public_ip_address}"
}