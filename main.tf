resource "vultr_instance" "es_srv" {
  // count = var.num_vultr_srvs
  count = 1
  hostname    = "es_test_${count.index}"
  plan        = "vc2-1c-2gb"
  region      = "ord"
# 516 is Fedora 35
  os_id       = "516"
  enable_ipv6 = "true"
  private_network_ids = ["cd74a098-79da-4448-9626-3b53ce3d304e"]
  ssh_key_ids = ["36673afd-4b24-4864-b4d1-7a0373110fef"]
  user_data = file("user-data.yml")
}
