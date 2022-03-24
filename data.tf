data "template_file" "user_data" {
 count = var.num_vultr_srvs
 // template = file("${path.module}/user-data.yml")
 template = "${file("${path.module}/user-data.yml.tpl")}"
 vars = {
   ip_addr = "${count.index + 1 }"
 }
}
data "template_cloudinit_config" "client_multipart" {
  gzip = false
  base64_encode = false
  count = var.num_vultr_srvs
  part {
    content_type = "text/cloud-config"
    content = "${data.template_file.user_data[count.index].rendered}"
  }
}

//
// data "template_file" "pclient_network_data" {
//  count = 2
//  // template = file("${path.module}/network-data.yml")
//  template = "${file("${path.module}/pclient-network-data.yml.tpl")}"
//  vars = {
//    gay_bar_ip = "${count.index + 4 }"
//  }
// }
//
// data "template_cloudinit_config" "pclient_multipart" {
//  gzip = false
//  base64_encode = false
//  count = 2
//  part {
//    content_type = "text/cloud-config"
//    content = "${data.template_file.puser_data[count.index].rendered}"
//  }
//
//  part {
//    content_type = "x-shellscript"
//    content = file("${path.module}/debian-dhcp-disable.sh")
//  }
//
// }
//
// resource "libvirt_cloudinit_disk" "pclient_cloud_config" {
//  count = 2
//  name = "pclient${count.index}.iso"
//  user_data = data.template_cloudinit_config.pclient_multipart[count.index].rendered
//  meta_data = data.template_file.meta_data.rendered
//  network_config = data.template_file.pclient_network_data[count.index].rendered
//  pool = "isos"
// }
