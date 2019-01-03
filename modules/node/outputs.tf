output "public_ip" {
  value = "${concat(compact(split(",", join(",", module.hetzner_nodes.public_ip))), compact(split(",", join(",", module.scaleway_nodes.public_ip))))}" # black magic
}
