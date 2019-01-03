data "scaleway_image" "image" {
  count        = "${var.node_count > 0 ? 1 : 0}"

  architecture = "${var.server_arch}"
  name         = "${var.server_image}"
}

resource "scaleway_server" "node" {
  count               = "${var.node_count}"

  name                = "${var.node_name}-${count.index}"

  image               = "${data.scaleway_image.image.id}"
  type                = "${var.server_type}"
  dynamic_ip_required = true
}

