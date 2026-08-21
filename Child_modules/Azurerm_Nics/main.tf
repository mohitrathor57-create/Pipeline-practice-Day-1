resource "azurerm_network_interface" "Nics" {
    for_each = var.Nics
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name

    ip_configuration {
      name = "internal"
      subnet_id = data.azurerm_subnet.Subnet[each.key].id
      private_ip_address_allocation = "Dynamic"
    }

  
}