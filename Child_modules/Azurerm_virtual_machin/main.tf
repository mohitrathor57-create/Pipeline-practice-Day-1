resource "azurerm_virtual_machine" "linux_vm" {
    for_each = var.VMs
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    network_interface_ids = [data.azurerm_network_interface.Nic[each.key].id]
    vm_size = each.value.vm_size

os_profile_linux_config {
  disable_password_authentication = false
}

    storage_image_reference {
      publisher = "Canonical"
      offer = "0001-com-ubuntu-server-jammy"
      sku = "22_04-lts"
      version = "latest"
    }
    storage_os_disk {
      name = "myosdisk1"
      caching = "ReadWrite"
      create_option = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile {
      computer_name = each.value.computer_name
      admin_username = each.value.admin_username
      admin_password = each.value.admin_password
    }
    
  
}