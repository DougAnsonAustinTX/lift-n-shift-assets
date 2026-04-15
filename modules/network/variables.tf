variable "prefix" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "vnet_address_space" {
  type = list(string)
}

variable "subnet_prefixes" {
  type = list(string)
}

variable "allowed_ssh_cidr" {
  type = string
}

variable "allow_mysql_inbound" {
  type = bool
}

variable "allowed_mysql_cidr" {
  type = string
}
