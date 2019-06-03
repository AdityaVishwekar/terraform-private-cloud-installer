output "ids" {
  value = ["${oci_core_instance.app-instance.*.id}"]
}

output "private_ips" {
  value = ["${oci_core_instance.app-instance.*.private_ip}"]
}

output "instance_public_ips" {
  value = ["${oci_core_instance.app-instance.*.public_ip}"]
}