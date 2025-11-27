resource "azurerm_storage_account" "storage_account" {
  for_each = var.storage_accounts
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  #Optional Simple Arguments
  account_kind                      = lookup(each.value, "account_kind", null)
  provisioned_billing_model_version = lookup(each.value, "provisioned_billing_model_version", null)
  cross_tenant_replication_enabled  = lookup(each.value, "cross_tenant_replication_enabled", null)
  access_tier                       = lookup(each.value, "access_tier", null)
  edge_zone                         = lookup(each.value, "edge_zone", null)
  https_traffic_only_enabled        = lookup(each.value, "https_traffic_only_enabled", true)
  min_tls_version                   = lookup(each.value, "min_tls_version", "TLS1_2")
  allow_nested_items_to_be_public   = lookup(each.value, "allow_nested_items_to_be_public", true)
  shared_access_key_enabled         = lookup(each.value, "shared_access_key_enabled", true)
  public_network_access_enabled     = lookup(each.value, "public_network_access_enabled", true)
  default_to_oauth_authentication   = lookup(each.value, "default_to_oauth_authentication", false)
  is_hns_enabled                    = lookup(each.value, "is_hns_enabled", false)
  nfsv3_enabled                     = lookup(each.value, "nfsv3_enabled", false)
}