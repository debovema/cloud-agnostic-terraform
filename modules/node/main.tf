# AWS
module "aws_nodes" {
  source                         = "../aws"

  node_count                     = "${var.cloud_provider == "aws" ? var.node_count : 0}"
  node_name                      = "${var.node_name}"

  ami_name_filter                = "${var.aws_ami_name_filter}"
  ami_owners                     = "${var.aws_ami_owners}"
  ami_virtualization_type_filter = "${var.aws_ami_virtualization_type_filter}"
  instance_type                  = "${var.aws_instance_type}"
  private_key                    = "${var.private_key}"
  region                         = "${var.aws_region}"
}

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

