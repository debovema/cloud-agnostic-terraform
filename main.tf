# define nodes in a cloud-agnostic way
module "nodes" {
  source                             = "./modules/node"

  cloud_provider                     = "${var.cloud_provider}"
  node_name                          = "${var.node_name}"
  node_count                         = "${var.node_count}"
  private_key                        = "${var.private_key}"

  hetzner_server_image               = "${var.hetzner_server_image}"
  hetzner_server_type                = "${var.hetzner_server_type}"

  scaleway_server_arch               = "${var.scaleway_server_arch}"
  scaleway_server_image              = "${var.scaleway_server_image}"
  scaleway_server_type               = "${var.scaleway_server_type}"

  aws_region                         = "${var.aws_region}"
  aws_ami_name_filter                = "${var.aws_ami_name_filter}"
  aws_ami_virtualization_type_filter = "${var.aws_ami_virtualization_type_filter}"
  aws_ami_owners                     = "${var.aws_ami_owners}"
  aws_instance_type                  = "${var.aws_instance_type}"
}

# install a package on created nodes
resource "null_resource" "git" {
  count = "${var.node_count}"
  triggers {
    cloud_provider = "${var.cloud_provider}"
  }

  connection {
    host = "${element(module.nodes.public_ip, count.index)}"
    user = "${var.ssh_user}"
    private_key = "${file(var.private_key)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y git",
    ]
  }
}
