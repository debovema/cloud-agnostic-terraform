output "public_ip" {
  value = "${aws_instance.node.*.public_ip}"
}

