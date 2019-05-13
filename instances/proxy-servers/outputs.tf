output "ids" {
  value = ["${oci_core_instance.proxy-instance.*.id}"]
}

output "private_ips" {
  value = ["${oci_core_instance.proxy-instance.*.private_ip}"]
}

output "instance_public_ips" {
  value = ["${oci_core_instance.proxy-instance.*.public_ip}"]
}