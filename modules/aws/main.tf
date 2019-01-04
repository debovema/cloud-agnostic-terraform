provider "aws" {
  access_key = "${var.node_count > 0 ? "" : "disabled"}" # set to "disabled" if the module is not used, otherwise default variable AWS_ACCESS_KEY_ID will be used
  secret_key = "${var.node_count > 0 ? "" : "disabled"}" # set to "disabled" if the module is not used, otherwise default variable AWS_SECRET_ACCESS_KEY will be used
  region = "${var.region}"

  # ignore wrong credentials if the module is not used
  skip_credentials_validation = "${var.node_count > 0 ? 0 : 1}"
  skip_region_validation = "${var.node_count > 0 ? 0 : 1}"
}

locals {
  private_key_sha512 = "${sha1(file(var.private_key))}"
}

data "tls_public_key" "public_key" {
  count           = "${var.node_count > 0 ? 1 : 0}"

  private_key_pem = "${file(var.private_key)}"
}

resource "aws_key_pair" "ssh_key" {
  count      = "${var.node_count > 0 ? 1 : 0}"

  public_key = "${data.tls_public_key.public_key.public_key_openssh}"
}

resource "aws_security_group" "sg" {
  count = "${var.node_count > 0 ? 1 : 0}"

  name  = "allow_all"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "image" {
  count       = "${var.node_count > 0 ? 1 : 0}"

  most_recent = true

  filter {
    name      = "name"
    values    = "${var.ami_name_filter}"
  }

  filter {
    name      = "virtualization-type"
    values    = "${var.ami_virtualization_type_filter}"
  }

  owners      = "${var.ami_owners}"
}

resource "aws_instance" "node" {
  count           = "${var.node_count}"

  ami             = "${data.aws_ami.image.id}"
  instance_type   = "${var.instance_type}"
  key_name        = "${aws_key_pair.ssh_key.key_name}"
  security_groups = ["${aws_security_group.sg.name}"]

  tags {
    Name          = "${var.node_name}"
  }
}

