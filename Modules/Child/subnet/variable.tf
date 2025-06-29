variable "subnet_name" {
  description = "subnate name"
type = string
  }
variable "rg_name" {
  description = "resource group name"
type = string
  }
  variable "vn_name" {
  description = "virtual network name"
type = string
  }
  variable "address_prefixes" {
  description = "address prifix"
type = list(string)
  }