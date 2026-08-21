resource "azurerm_bastion_host" "bastions" {
    for_each = var.bastion
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location

    ip_configuration {
      name = "configuration"
      subnet_id = data.azurerm_subnet.Subnet[each.key].id
      public_ip_address_id = data.azurerm_public_ip.PIPs[each.key].id
    }
  
}