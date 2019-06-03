resource "oci_core_instance" "app-instance" {
  availability_domain = "${var.availability_domain}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.label_prefix}${var.display_name_prefix}-${count.index}"
  #image = "${lookup(data.oci_core_images.ImageOCID.images[0], "id")}"
  image = "ocid1.image.oc1.iad.aaaaaaaageeenzyuxgia726xur4ztaoxbxyjlxogdhreu3ngfj2gji3bayda"
  shape = "${var.shape}"
  
  create_vnic_details {
    subnet_id = "${var.subnet_id}"
    display_name = "${var.label_prefix}${var.display_name_prefix}-${count.index}"
    assign_public_ip = false
    hostname_label = "${var.hostname_label_prefix}-${count.index}"
  },
  
  metadata {
    ssh_authorized_keys = "${file("${var.ssh_public_key}")}"
  }
  
  timeouts {
    create = "60m"
  }
}