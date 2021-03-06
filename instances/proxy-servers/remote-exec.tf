resource "null_resource" "remote-exec" {
    depends_on = ["oci_core_instance.proxy-instance","oci_core_volume_attachment.TFBlock0Attach"]
    provisioner "remote-exec" {
      connection {
        agent = true
        type = "ssh"
        timeout = "30m"
        host = "${data.oci_core_vnic.InstanceVnic.public_ip_address}"
        user = "ubuntu"
        #private_key = "${file("/home/osboxes/.ssh/privateKey")}"
        private_key = "${file("${var.ssh_private_key}")}"
    }
      inline = [
        "touch ~/IMadeAFile.Right.Here",
        "sudo iscsiadm -m node -o new -T ${oci_core_volume_attachment.TFBlock0Attach.iqn} -p ${oci_core_volume_attachment.TFBlock0Attach.ipv4}:${oci_core_volume_attachment.TFBlock0Attach.port}",
        "sudo iscsiadm -m node -o update -T ${oci_core_volume_attachment.TFBlock0Attach.iqn} -n node.startup -v automatic",
        "echo sudo iscsiadm -m node -T ${oci_core_volume_attachment.TFBlock0Attach.iqn} -p ${oci_core_volume_attachment.TFBlock0Attach.ipv4}:${oci_core_volume_attachment.TFBlock0Attach.port} -l >> ~/.bashrc",
      ]
    }
}

resource "null_resource" "install-nginx" {
    depends_on = ["oci_core_instance.proxy-instance","oci_core_volume_attachment.TFBlock0Attach"]
    provisioner "file" {
      connection {
        agent = true
        type = "ssh"
        timeout = "30m"
        host = "${data.oci_core_vnic.InstanceVnic.public_ip_address}"
        user = "ubuntu"
        private_key = "${file("${var.ssh_private_key}")}"
        }
        source = "/home/osboxes/Documents/terraform-private-cloud-installer/instances/proxy-servers/scripts/"
        destination = "~/"
    }
    provisioner "remote-exec" {
      connection {
        agent = true
        type = "ssh"
        timeout = "30m"
        host = "${data.oci_core_vnic.InstanceVnic.public_ip_address}"
        user = "ubuntu"
        #private_key = "${file("/home/osboxes/.ssh/privateKey")}"
        private_key = "${file("${var.ssh_private_key}")}"
    }
      inline = [
        "chmod a+x setupNginx.sh",
        "sudo ./setupNginx.sh"
      ]
    }
}

resource "null_resource" "install-ansible" {
    depends_on = ["oci_core_instance.proxy-instance","oci_core_volume_attachment.TFBlock0Attach"]
    provisioner "file" {
      connection {
        agent = true
        type = "ssh"
        timeout = "30m"
        host = "${data.oci_core_vnic.InstanceVnic.public_ip_address}"
        user = "ubuntu"
        private_key = "${file("${var.ssh_private_key}")}"
        }
        source = "/home/osboxes/Documents/terraform-private-cloud-installer/instances/proxy-servers/scripts/"
        destination = "~/"
    }
    provisioner "remote-exec" {
      connection {
        agent = true
        type = "ssh"
        timeout = "30m"
        host = "${data.oci_core_vnic.InstanceVnic.public_ip_address}"
        user = "ubuntu"
        #private_key = "${file("/home/osboxes/.ssh/privateKey")}"
        private_key = "${file("${var.ssh_private_key}")}"
    }
      inline = [
        "chmod a+x setupNginx.sh",
        "sudo ./setupNginx.sh"
      ]
    }
}