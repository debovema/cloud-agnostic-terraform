output "public_ip" {
  value = "${hcloud_server.node.*.ipv4_address}"
}
