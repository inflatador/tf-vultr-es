output "es_srv_ips" {
  description = "es server IPs"
  value = vultr_instance.es_srv.*.main_ip
}
