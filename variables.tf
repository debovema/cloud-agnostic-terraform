variable "cloud_provider" {
  type    = "string" # can be 'hetzner', 'scaleway'
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

# Cloud-specific

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
