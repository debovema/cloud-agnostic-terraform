locals {
  private_key_sha512 = "${sha1(file(var.private_key))}"
}

data "tls_public_key" "public_key" {
  count           = "${var.node_count > 0 ? 1 : 0}"

  private_key_pem = "${file(var.private_key)}"
}

resource "hcloud_ssh_key" "ssh_key" {
  count      = "${var.node_count > 0 ? 1 : 0}"

  name       = "${data.tls_public_key.public_key.public_key_fingerprint_md5}"
  public_key = "${data.tls_public_key.public_key.public_key_openssh}"
}

resource "hcloud_server" "node" {
  count       = "${var.node_count}"

  name        = "${var.node_name}-${count.index}"
  image       = "${var.server_image}"
  server_type = "${var.server_type}"

  ssh_keys    = ["${hcloud_ssh_key.ssh_key.name}"]
}

