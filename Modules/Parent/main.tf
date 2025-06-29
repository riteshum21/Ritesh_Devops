module "rg" {
  source   = "../Child/resource_group"
  rg_name  = "rg890"
  location = "north europe"
}

module "storage" {
  source                   = "../Child/data_storage"
  depends_on               = [module.rg]
  rg_name                  = "rg890"
  sg_name                  = "sg90"
  location                 = "north europe"
  account_replication_type = "GRS"
  account_tier             = "Standard"
}

module "vn" {
  source        = "../Child/vartual_network"
  address_space = ["10.0.0.0/16"]
  vn_name       = "vn90"
  location      = "north europe"
  rg_name       = "rg890"
  depends_on    = [module.rg]
}

module "fsn" {
  source           = "../Child/subnet"
  depends_on       = [module.vn]
  subnet_name      = "fsn90"
  rg_name          = "rg890"
  vn_name          = "vn90"
  address_prefixes = ["10.0.1.0/24"]
}

module "bsn" {
  source           = "../Child/subnet"
  depends_on       = [module.vn]
  subnet_name      = "bsn90"
  rg_name          = "rg890"
  vn_name          = "vn90"
  address_prefixes = ["10.0.2.0/24"]
}

# module "pip" {
#   source            = "../Child/public_ip"
#   pip_name          = "public_ip"
#   location          = "north europe"
#   rg_name           = "rg890"
#   allocation_method = "Static"
# }
module "fvm" {
  depends_on      = [module.fsn]
  source          = "../Child/vartual_machine"
  fvm_name         = "fvm90"
  rg_name         = "rg890"
  location        = "north europe"
  fvm_size        = "Standard_F2"
  fvm_username    = "faduadmin"
  fvm_password    = "Fadu@99887766"
  image_Publisher = "Canonical"
  image_offer     = "0001-com-ubuntu-server-jammy"
  image_sku       = "22_04-lts"
  image_version   = "latest"
  nic_name        = "fnic90"
  subnet_id       = "/subscriptions/34efc0a7-8590-4931-b801-1a4f91725596/resourceGroups/rg90/providers/Microsoft.Network/virtualNetworks/vn90/subnets/fsn90"
}

module "bvm" {
  depends_on      = [module.bsn]
  source          = "../Child/vartual_machine"
  fvm_name         = "bm90"
  rg_name         = "rg890"
  location        = "north europe"
  fvm_size        = "Standard_F2"
  fvm_username    = "faduadmin"
  fvm_password    = "Fadu@99887766"
  image_Publisher = "Canonical"
  image_offer     = "0001-com-ubuntu-server-focal"
  image_sku       = "20_04-lts"
  image_version   = "latest"
  nic_name        = "bnic90"
  subnet_id       = "/subscriptions/34efc0a7-8590-4931-b801-1a4f91725596/resourceGroups/rg90/providers/Microsoft.Network/virtualNetworks/vn90/subnets/bsn90"

  # os_disk {
  #   caching              = "ReadWrite"
  #   storage_account_type = "Standard_LRS"
  # }

  # source_image_reference {

  # }
}

module "sql_server" {
  source = "../Child/sql_server"
  depends_on      = [module.rg]
  sql_server = "sq-s90"
  rg_name         = "rg890"
  location        = "north europe"
  sql_version     = "12.0"
  sql_login       = "fadusqllogin"
  sql_password    = "Fadu@99887766"

}

# module "sql_db" {
#   source = "../Child/sql_databse"
#   depends_on = [ module.sql_server ]
#    sql_db_name = "sqdb90"
#   sql_server_id   = "var.sql_server_id"
# }
