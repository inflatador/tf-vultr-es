
output "es_srv_ips" {
  description = "es server IPs"
  value = vultr_instance.es_srv.*.main_ip
}

// resource "local_file" "ansible_inventory" {
//   content = templatefile("hosts.tmpl",
//   {
//   ansible_ips = tolist(vultr_instance.es_srv.*.main_ip)
//   })
//   filename = "hosts"
// }
