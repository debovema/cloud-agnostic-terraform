variable "cloud_provider" {
  type    = "string" # can be 'aws', 'hetzner', 'scaleway'
}

# Common
variable "node_name" {
  type    = "string"
  default = "node"
}
variable "node_count" {
  type    = "string"
  default = "2"
}
variable "private_key" {
  type    = "string"
}
variable "ssh_user" {
  type    = "string"
  default = "root"
}

# Cloud-specific

## AWS
variable "aws_region" {
  type    = "string"
  default = "us-west-2"
}

variable "aws_ami_name_filter" {
  type    = "list"
  default = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
}

variable "aws_ami_virtualization_type_filter" {
  type    = "list"
  default = ["hvm"]
}

variable "aws_ami_owners" {
  type    = "list"
  default = ["099720109477"] # Canonical
}

variable "aws_instance_type" {
  type    = "string"
  default = "t2.micro"
}

## Hetzner
variable "hetzner_server_image" {
  type    = "string"
  default = "ubuntu-18.04"
}

variable "hetzner_server_type" {
  type    = "string"
  default = "cx11"
}

## Scaleway
variable "scaleway_server_arch" {
  type    = "string"
  default = "x86_64"
}

variable "scaleway_server_image" {
  type    = "string"
  default = "Ubuntu Xenial"
}

variable "scaleway_server_type" {
  type    = "string"
  default = "VC1S"
}
