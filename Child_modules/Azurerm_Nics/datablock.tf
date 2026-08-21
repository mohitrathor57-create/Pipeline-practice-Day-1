data "azurerm_subnet" "Subnet" {
    for_each = var.Nics
    name = each.value.nic_subnet_name
    virtual_network_name = each.value.virtual_network_name
    resource_group_name = each.value.resource_group_name
  
}