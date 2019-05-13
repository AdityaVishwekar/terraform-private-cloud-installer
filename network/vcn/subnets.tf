resource "oci_core_subnet" "PublicSubnet" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  cidr_block = "10.1.20.0/24"
  display_name = "PublicSubnet"
  dns_label = "tfpublicsubnet"
  security_list_ids = ["${oci_core_virtual_network.ExampleVCN.default_security_list_id}"]
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.ExampleVCN.id}"
  route_table_id = "${oci_core_route_table.ExampleRT.id}"
  dhcp_options_id = "${oci_core_virtual_network.ExampleVCN.default_dhcp_options_id}"
}