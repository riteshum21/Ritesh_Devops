module "rg" {
  source   = "../module/az_resource_group"
  rg_name  = "rg_rit"
  location = "west europe"
}

module "sg" {
  source     = "../module/az_storage_account"
  sg_name    = "storage1"
  rg_name    = "rg_rit"
  location   = "west europe"
  depends_on = [module.rg]
}

module "vnet" {
  source        = "../module/az_virtual_network"
  vnet_name     = "vnet_f"
  rg_name       = "rg_rit"
  location      = "west europe"
  address_space = ["10.0.0.0/16"]
  depends_on    = [module.rg]
}

module "subnet_f" {
  source           = "../module/az_subnet"
  subnet_name      = "subnet_f"
  vnet_name        = "vnet_f"
  rg_name          = "rg_rit"
  location         = "west europe"
  address_prefixes = ["10.0.0.0/24"]
  depends_on       = [module.vnet]
}

module "f_pip" {
 source = "../module/az_public_ip"
 pip_name = "f_pip"
 rg_name = "rg_rit"
 location = "west europe"
 depends_on = [ module.rg ]
}

module "f_VM" {
  source          = "../module/az_virtual_machine"
  virtual_machine = "f_vm"
  subnet_name     = "subnet_f"
  vnet_name       = "vnet_f"
  rg_name         = "rg_rit"
  location        = "west europe"
  size            = "Standard_F2"
  nic_name        = "nic_f"
  username        = "fadu"
  password        = "fadu@321"
  publisher       = "Canonical"
  offer           = "0001-com-ubuntu-server-jammy"
  sku             = "22_04-lts"
  image_version   = "latest"
  pip_name = "f_pip"
  depends_on = [ module.rg,module.vnet,module.subnet_f,module.f_pip ]
}

module "sqlserver" {
  source = "../module/az_sql_server"
  mssqlserver = "sqlserver"
rg_name         = "rg_rit"
  location        = "west europe"
  username = "fantu"
  password = "fadu@123"
  depends_on = [ module.rg ]
}

module "sqldb" {
  source = "../module/az_sql_database"
  mysqldb = "sqldb"
  mssqlserver = "sqlserver"
rg_name         = "rg_rit"
  location        = "west europe"
  depends_on = [ module.sqlserver,module.rg ]
}