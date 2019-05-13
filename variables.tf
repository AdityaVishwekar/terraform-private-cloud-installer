variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}
variable "ssh_public_key" {}
variable "ssh_private_key" {}
# Choose an Availability Domain
variable "AD" {
    default = "1"
}
variable "proxyShape" {
    default = "VM.Standard2.1"
}
variable "InstanceImageOCID" {
    type = "map"
    default = {
        // Oracle-provided image "Oracle-Linux-7.4-2017.12.18-0"
        // See https://docs.us-phoenix-1.oraclecloud.com/Content/Resources/Assets/OracleProvidedImageOCIDs.pdf
        //us-phoenix-1 = "ocid1.image.oc1.phx.aaaaaaaa3av7orpsxid6zdpdbreagknmalnt4jge4ixi25cwxx324v6bxt5q"
        us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaaxrqeombwty6jyqgk3fraczdd63bv66xgfsqka4ktr7c57awr3p5a"
        //eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaayxmzu6n5hsntq4wlffpb4h6qh6z3uskpbm5v3v4egqlqvwicfbyq"
    }
}
variable "DBSize" {
    default = "50" // size in GBs
}
variable "BootStrapFile" {
    default = "./userdata/bootstrap"
}

variable "label_prefix" {
  description = "To create unique identifier for multiple clusters in a compartment."
  type        = "string"
  default     = ""
}

variable "proxy_ol_image_name" {
  default = "Oracle-Linux-7.5-2018.10.16-0"
}

variable "ssh_public_key_openssh" {
  description = "SSH public key in OpenSSH authorized_keys format for instances (generated if left blank)"
  type        = "string"
  default     = ""
}

variable "proxyAd1Count" {
  default = 0
}

variable "network_cidrs" {
  type = "map"

  default = {
    VCN-CIDR          = "10.0.0.0/16"
    PublicSubnetAD1   = "10.0.1.0/24"
  }
}

variable "domain_name" {
  default = "proxy.oraclevcn.com"
}