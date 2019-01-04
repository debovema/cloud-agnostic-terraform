variable "cloud_provider" {
  type    = "string" # can be 'hetzner', 'scaleway'
}

# Common
variable "node_count" {
  type    = "string"
}
variable "node_name" {
  type    = "string"
}
variable "private_key" {
  type    = "string"
}

# Cloud-specific

## AWS
variable "aws_region" {
  type    = "string"
}

variable "aws_ami_name_filter" {
  type    = "list"
}

variable "aws_ami_virtualization_type_filter" {
  type    = "list"
}

variable "aws_ami_owners" {
  type    = "list"
}

variable "aws_instance_type" {
  type    = "string"
}

## Hetzner
variable "hetzner_server_image" {
  type    = "string"
}

variable "hetzner_server_type" {
  type    = "string"
}

## Scaleway
variable "scaleway_server_arch" {
  type    = "string"
}

variable "scaleway_server_image" {
  type    = "string"
}

variable "scaleway_server_type" {
  type    = "string"
}
