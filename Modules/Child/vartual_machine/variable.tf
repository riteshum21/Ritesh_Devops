variable "nic_name" {
  type = string
  }
variable "location" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "fvm_name" {
  type = string
}
variable "fvm_username" {
  type = string
}
variable "fvm_password" {
  type = string
}
variable "fvm_size" {
  type = string
}

variable "image_Publisher" {
  type = string
    
}
variable "image_offer" {
  type = string
}

variable "image_sku" {
  type = string
}
variable "image_version" {
  type = string
}