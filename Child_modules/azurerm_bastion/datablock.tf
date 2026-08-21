data "azurerm_subnet" "Subnet" {
    for_each = var.bastion
    name = each.value.bastion_subnet_name
    virtual_network_name = each.value.virtual_network_name
    resource_group_name = each.value.resource_group_name
  
}

data "azurerm_public_ip" "PIPs" {
    for_each = var.bastion
    name = each.value.bastion_public_ip_name
    resource_group_name = each.value.resource_group_name
  
}