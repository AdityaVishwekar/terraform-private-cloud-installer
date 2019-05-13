## Virtual Cloud Network
module "vcn" {
  source                      = "./network/vcn"
  compartment_ocid            = "${var.compartment_ocid}"
}

## Compute Instances
module "instances-proxy-ad1" {
  source                      = "./instances/proxy-servers"
  count                       = "${var.proxyAd1Count}"
  availability_domain         = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  compartment_ocid            = "${var.compartment_ocid}"
  display_name_prefix         = "proxy-ad1"
  label_prefix                = "${var.label_prefix}"
  oracle_linux_image_name     = "${var.proxy_ol_image_name}"
  subnet_id                   = "${module.vcn.proxy_subnet_ad1_id}"
  ssh_public_key		      = "${var.ssh_public_key}"
  ssh_private_key			  = "${var.ssh_private_key}"
  shape                       = "${var.proxyShape}"
  network_cidrs               = "${var.network_cidrs}"
  subnet_name                 = "proxySubnetAD1"
  domain_name                 = "${var.domain_name}"
  hostname_label_prefix       = "proxy-ad1"
}