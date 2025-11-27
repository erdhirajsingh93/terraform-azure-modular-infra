module "resource_group" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}


module "storage_account" {
  depends_on       = [module.resource_group]
  source           = "../../modules/azurerm_storage_account"
  storage_accounts = var.storage_accounts
}


module "virtual_network" {
  depends_on       = [module.resource_group]
  source           = "../../modules/azurerm_virtual_network"
  virtual_networks = var.virtual_networks

}

module "network_interface" {
  depends_on         = [module.virtual_network]
  source             = "../../modules/azurerm_network_interface"
  network_interfaces = var.network_interfaces
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}

module "linux_virtual_machine" {
  depends_on             = [module.network_interface]
  source                 = "../../modules/azurerm_linux_virtual_machine"
  linux_virtual_machines = var.linux_virtual_machines

}

module "kubernetes_cluster" {
  depends_on          = [module.resource_group]
  source              = "../../modules/azurerm_kubernetes_cluster"
  kubernetes_clusters = var.kubernetes_clusters
}

module "container_registries" {
  depends_on           = [module.resource_group]
  source               = "../../modules/azurerm_container_registry"
  container_registries = var.container_registries
}


module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
}


module "azurerm_bastion_host" {
  depends_on    = [module.virtual_network, module.public_ip, module.resource_group]
  source        = "../../modules/azurerm_bastion_host"
  bastion_hosts = var.bastion_hosts
}


module "mssql_server" {
  depends_on    = [module.resource_group]
  source        = "../../modules/azurerm_mssql_server"
  mssql_servers = var.mssql_servers
}


module "mssql_database" {
  depends_on      = [module.mssql_server]
  source          = "../../modules/azurerm_mssql_database"
  mssql_databases = var.mssql_databases
}