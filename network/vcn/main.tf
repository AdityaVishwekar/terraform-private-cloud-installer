resource "oci_core_virtual_network" "ExampleVCN" {
  cidr_block = "10.1.0.0/16"
  compartment_id = "${var.compartment_ocid}"
  display_name = "TFExampleVCN"
  dns_label = "tfexamplevcn"
}
  
resource "oci_core_internet_gateway" "ExampleIG" {
  compartment_id = "${var.compartment_ocid}"
  display_name = "TFExampleIG"
  vcn_id = "${oci_core_virtual_network.ExampleVCN.id}"
}
  
resource "oci_core_route_table" "ExampleRT" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.ExampleVCN.id}"
  display_name = "TFExampleRouteTable"
  route_rules {
    cidr_block = "0.0.0.0/0"
    network_entity_id = "${oci_core_internet_gateway.ExampleIG.id}"
  }
}

resource "oci_core_nat_gateway" "ExampleNAT" {
    compartment_id = "${var.compartment_ocid}"
    display_name = "TFExampleNAT"
    vcn_id = "${oci_core_virtual_network.ExampleVCN.id}"
}

resource "oci_core_route_table" "ExampleNATRT" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.ExampleVCN.id}"
  display_name = "TFNATRouteTable"
  route_rules {
    cidr_block = "0.0.0.0/0"
    network_entity_id = "${oci_core_nat_gateway.ExampleNAT.id}"
  }
}