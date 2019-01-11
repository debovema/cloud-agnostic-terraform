# install ZSH created nodes
resource "null_resource" "zsh" {
  count = "${var.public_ips.count}"

  connection {
    host = "${element(var.public_ips, count.index)}"
    user = "${var.ssh_user}"
    private_key = "${file(var.private_key)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y zsh",
    ]
  }
}

