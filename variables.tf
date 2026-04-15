variable "prefix" {
  description = "Prefix for resource names."
  type        = string
  default     = "mysql-migrate"
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "eastus2"
}

variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
  default = {
    environment = "prod"
    workload    = "mysql-migration"
    managed_by  = "terraform"
  }
}

variable "source_mysql_database" {
  description = "Source MySQL database name."
  type        = string
  default     = "testdb"
}

variable "admin_username" {
  description = "Admin username for Azure VM."
  type        = string
  default     = "azureadmin"
}

variable "ssh_public_key" {
  description = "RSA SSH public key for the Azure VM admin. Azure Linux VM provisioning requires an ssh-rsa public key."
  type        = string

  validation {
    condition     = startswith(trimspace(var.ssh_public_key), "ssh-rsa ")
    error_message = "ssh_public_key must be an RSA public key beginning with 'ssh-rsa '. Azure does not accept ssh-ed25519 here."
  }
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH to the VM."
  type        = string
}

variable "allow_mysql_inbound" {
  description = "Whether to allow inbound TCP/3306 to the VM."
  type        = bool
  default     = false
}

variable "allowed_mysql_cidr" {
  description = "CIDR allowed to access MySQL if inbound is enabled."
  type        = string
  default     = "0.0.0.0/0"
}

variable "vnet_address_space" {
  description = "Address space for the VNet."
  type        = list(string)
  default     = ["10.20.0.0/16"]
}

variable "subnet_prefixes" {
  description = "Subnet prefixes."
  type        = list(string)
  default     = ["10.20.1.0/24"]
}

variable "vm_size" {
  description = "Azure VM size."
  type        = string
  default     = "Standard_E32pds_v6"
}

variable "os_disk_type" {
  description = "OS disk SKU."
  type        = string
  default     = "Premium_LRS"
}

variable "os_disk_size_gb" {
  description = "The size of the disk in GB"
  type        = number
  default     = 128
}
