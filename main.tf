resource "vultr_private_network" "es_net" {
    description = "Elasticsearch private network"
    region = "ewr"
    v4_subnet = "172.23.156.0"
    v4_subnet_mask = 24
}

resource "vultr_instance" "es_srv" {
  // count = var.num_vultr_srvs
  count = var.num_vultr_srvs
  hostname    = "lammergeier_${count.index}"
  label       = "lammergeier_${count.index}"
  plan        = "vc2-1c-2gb"
  region      = "ewr"
# 244 is Debian Stretch
  os_id       = "244"
  enable_ipv6 = "true"
  private_network_ids = [ vultr_private_network.es_net.id ]
  ssh_key_ids = ["36673afd-4b24-4864-b4d1-7a0373110fef"]
  user_data = data.template_cloudinit_config.client_multipart[count.index].rendered
}

resource "local_file" "ansible_inventory" {
  content = templatefile("hosts.tmpl",
  {
  ansible_ips = join("\n", vultr_instance.es_srv.*.main_ip)
  })
  filename = "hosts"
}
