variable "vn_name" {
  description= "vertual network name"
 type = string
  }

variable "location" {
  description= "vertual network location"
 type = string
  }
  variable "rg_name" {
  description= "resouce group name"
 type = string
  }
  variable "address_space" {
  description= "adress space"
 type = list(string)
  }
