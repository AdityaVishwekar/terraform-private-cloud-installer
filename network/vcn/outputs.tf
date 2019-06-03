output "proxy_subnet_ad1_id" {
  value = "${oci_core_subnet.PublicSubnet.id}"
}

output "app_subnet_ad1_id" {
  value = "${oci_core_subnet.PrivateSubnet.id}"
}