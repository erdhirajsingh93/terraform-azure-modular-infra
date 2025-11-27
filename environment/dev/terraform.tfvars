subscription_id = "e4489957-2c09-442f-936c-3a4283afbde9"

resource_groups = {
  "rg-1" = {
    name     = "dhiraj-resource-group1"
    location = "central india"
  }
  "rg-2" = {
    name       = "dhiraj-resource-group2"
    location   = "central india"
    managed_by = "dhiraj"
    tags = {
      environment = "dev"
      owner       = "dhiraj"
} } }

storage_accounts = {
  "stg-1" = {
    name                     = "dhirajstorageaccount9871"
    account_tier             = "Standard"
    resource_group_name      = "dhiraj-resource-group1"
    location                 = "central india"
    account_replication_type = "LRS"

  }
  "stg-2" = {
    name                     = "dhirajstorageaccount9872"
    account_tier             = "Standard"
    resource_group_name      = "dhiraj-resource-group1"
    location                 = "central india"
    account_replication_type = "LRS"


  }
  "stg-3" = {
    name                     = "dhirajstorageaccount9873"
    account_tier             = "Standard"
    resource_group_name      = "dhiraj-resource-group2"
    location                 = "central india"
    account_replication_type = "LRS"
  }
}


virtual_networks = {
  vnet1 = {
    name                = "main-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "central india"
    resource_group_name = "dhiraj-resource-group1"
    subnets = {
      subnet1 = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
      subnet3 = {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.3.0/24"]
      }
    }
  }
  vnet2 = {
    name                = "secondary-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "central india"
    resource_group_name = "dhiraj-resource-group1"
    subnets = {
      subnet1 = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

public_ips = {
  ip1 = {
    name                = "dhiraj-public-ip1"
    resource_group_name = "dhiraj-resource-group1"
    location            = "central india"
    allocation_method   = "Static"
  }
  ip2 = {
    name                = "dhiraj-public-ip2"
    resource_group_name = "dhiraj-resource-group2"
    location            = "central india"
    allocation_method   = "Static"
  }
}


network_interfaces = {
  nic1 = {
    name                 = "dhiraj-nic1"
    location             = "central india"
    resource_group_name  = "dhiraj-resource-group1"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "secondary-vnet"
    ip_configurations = [{
      name                          = "dhiraj-nic1-ip"
      private_ip_address_allocation = "Dynamic"
    }]
  }
  nic2 = {
    name                 = "dhiraj-nic2"
    location             = "central india"
    resource_group_name  = "dhiraj-resource-group1"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "secondary-vnet"
    ip_configurations = [{
      name                          = "dhiraj-nic2-ip"
      private_ip_address_allocation = "Dynamic"
    }]
  }

}



linux_virtual_machines = {
  vm1 = {
    name                            = "dhiraj-vm1"
    resource_group_name             = "dhiraj-resource-group1"
    location                        = "central india"
    size                            = "standard_b1s"
    admin_username                  = "dhirajk234"
    admin_password                  = "Hanuman@12345"
    disable_password_authentication = false
    network_interface_name          = "dhiraj-nic1"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
  }
}


kubernetes_clusters = {
  cluster1 = {
    name                = "dhiraj-aks-cluster1"
    location            = "central india"
    resource_group_name = "dhiraj-resource-group1"
    dns_prefix          = "dhirajaks1"
    identity = {
      type = "SystemAssigned"
    }
    default_node_pool = [{
      name       = "cluster1pool"
      node_count = 1
      vm_size    = "Standard_DS2_v2"
    }]
  }
  cluster2 = {
    name                = "dhiraj-aks-cluster2"
    location            = "central india"
    resource_group_name = "dhiraj-resource-group2"
    dns_prefix          = "dhirajaks2"
    identity = {
      type = "SystemAssigned"
    }
    default_node_pool = [{
      name       = "cluster2pool"
      node_count = 1
      vm_size    = "Standard_DS2_v2"
    }]
  }
}


container_registries = {
  acr1 = {
    name                = "dhirajcontainerregistry1"
    resource_group_name = "dhiraj-resource-group1"
    location            = "central india"
    sku                 = "Premium"
    admin_enabled       = true
    georeplications = [
      {
        location                = "East US"
        zone_redundancy_enabled = false
        tags = {
          environment = "dev"
        }
      },
      {
        location                = "West US"
        zone_redundancy_enabled = false
        tags = {
          environment = "dev"
        }
      }
    ]
  }
}



key_vaults = {
  kv1 = {
    name                = "dhirajkv9304935"
    resource_group_name = "dhiraj-resource-group1"
    location            = "central india"
    sku_name            = "standard"
    access_policy = [{
      key_permissions     = ["get", "list"]
      secret_permissions  = ["get", "list"]
      storage_permissions = ["get", "list"]
    }]
  }

  kv2 = {
    name                = "dhirajkv9304936"
    resource_group_name = "dhiraj-resource-group2"
    location            = "central india"
    sku_name            = "standard"
    access_policy = [{
      key_permissions     = ["get", "list"]
      secret_permissions  = ["get", "list"]
      storage_permissions = ["get", "list"]
    }]
  }
}


bastion_hosts = {
  bastion1 = {
    name                 = "dhiraj-bastion-host1"
    location             = "central india"
    resource_group_name  = "dhiraj-resource-group1"
    subnet_name          = "subnet3"
    public_ip_name       = "ip1"
    virtual_network_name = "vnet1"
    ip_configuration = {
      name = "bastion1-ip-config"
    }
  }
  bastion2 = {
    name                 = "dhiraj-bastion-host2"
    location             = "central india"
    resource_group_name  = "dhiraj-resource-group2"
    subnet_name          = "subnet2"
    public_ip_name       = "ip2"
    virtual_network_name = "vnet2"
    ip_configuration = {
      name = "bastion2-ip-config"
    }
  }
}


mssql_servers = {
  mssql1 = {
    name                         = "dhiraj-mssql-server1"
    resource_group_name          = "dhiraj-resource-group1"
    location                     = "central india"
    version                      = "12.0"
    administrator_login          = "mssqladminuser"
    administrator_login_password = "Mssql@12345"
    minimum_tls_version          = "1.2"
    azuread_administrator = {
      login_username = "azureadadminuser1"
    }
  }
  mssql2 = {
    name                         = "dhiraj-mssql-server2"
    resource_group_name          = "dhiraj-resource-group2"
    location                     = "central india"
    version                      = "12.0"
    administrator_login          = "mssqladminuser"
    administrator_login_password = "Mssql@12345"
    minimum_tls_version          = "1.2"
    azuread_administrator = {
      login_username = "azureadadminuser2"
    }
  }
}


mssql_databases = {
  db1 = {
    name                = "dhiraj-mssql-database1"
    server_name         = "dhiraj-mssql-server1"
    resource_group_name = "dhiraj-resource-group1"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "BasePrice"
    max_size_gb         = 10
    sku_name            = "S0"
    enclave_type        = "Default"
  }
  db2 = {
    name                = "dhiraj-mssql-database2"
    server_name         = "dhiraj-mssql-server2"
    resource_group_name = "dhiraj-resource-group2"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "BasePrice"
    max_size_gb         = 20
    sku_name            = "S1"
    enclave_type        = "Default"
  }
}