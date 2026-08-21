data "azurerm_network_interface" "Nic" {
    for_each = var.VMs
    name = each.value.vm_nic_name
    resource_group_name = each.value.resource_group_name
}