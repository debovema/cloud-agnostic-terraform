variable "node_count" {
  type    = "string"
}

variable "node_name" {
  type    = "string"
}

variable "private_key" {
  type    = "string"
}

variable "region" {
  type    = "string"
}

variable "ami_name_filter" {
  type    = "list"
}

variable "ami_virtualization_type_filter" {
  type    = "list"
}

variable "ami_owners" {
  type    = "list"
}

variable "instance_type" {
  type    = "string"
}

