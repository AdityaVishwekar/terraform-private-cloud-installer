# Output the private and public IPs of the instance

output "proxy_public_ips" {
  value = "${compact(concat(module.instances-proxy-ad1.instance_public_ips))}"
}

output "proxy_private_ips" {
  value = "${concat(module.instances-proxy-ad1.private_ips)}"
}

output "app_public_ips" {
  value = "${compact(concat(module.instances-app-ad1.instance_public_ips))}"
}

output "app_private_ips" {
  value = "${concat(module.instances-app-ad1.private_ips)}"
}