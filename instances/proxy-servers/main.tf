resource "oci_core_instance" "proxy-instance" {
  availability_domain = "${var.availability_domain}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.label_prefix}${var.display_name_prefix}-${count.index}"
  image = "${lookup(data.oci_core_images.ImageOCID.images[0], "id")}"
  shape = "${var.shape}"
  
  create_vnic_details {
    subnet_id = "${var.subnet_id}"
    display_name = "${var.label_prefix}${var.display_name_prefix}-${count.index}"
    assign_public_ip = true
    hostname_label = "${var.hostname_label_prefix}-${count.index}"
  },
  
  metadata {
    ssh_authorized_keys = "${file("${var.ssh_public_key}")}"
  }
  
  timeouts {
    create = "60m"
  }
}