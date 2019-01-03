output "public_ip" {
  value = "${scaleway_server.node.*.public_ip}"
}

