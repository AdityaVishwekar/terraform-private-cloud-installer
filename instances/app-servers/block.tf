resource "oci_core_volume" "TFBlock0" {
  availability_domain = "${var.availability_domain}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "TFBlock0"
  size_in_gbs = "${var.DBSize}"
}
  
resource "oci_core_volume_attachment" "TFBlock0Attach" {
    attachment_type = "iscsi"
    compartment_id = "${var.compartment_ocid}"
    instance_id = "${oci_core_instance.app-instance.id}"
    volume_id = "${oci_core_volume.TFBlock0.id}"
}