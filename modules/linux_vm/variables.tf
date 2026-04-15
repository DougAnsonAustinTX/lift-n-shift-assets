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

variable "nic_id" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "os_disk_type" {
  type = string
}

variable "custom_data" {
  type = string
}

variable "os_disk_size_gb" {
  type = number
}
