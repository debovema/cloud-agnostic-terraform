# Hetzner
module "hetzner_nodes" {
  source       = "../hetzner"

  node_count   = "${var.cloud_provider == "hetzner" ? var.node_count : 0}"
  node_name    = "${var.node_name}"
  server_image = "${var.hetzner_server_image}"
  server_type  = "${var.hetzner_server_type}"
  private_key  = "${var.private_key}"
}

# Scaleway
module "scaleway_nodes" {
  source       = "../scaleway"

  node_count   = "${var.cloud_provider == "scaleway" ? var.node_count : 0}"
  node_name    = "${var.node_name}"
  server_arch  = "${var.scaleway_server_arch}"
  server_image = "${var.scaleway_server_image}"
  server_type  = "${var.scaleway_server_type}"
}

