module "resource_group" {
  source = "../../Child_modules/azurerm_resource_group"
  RGs    = var.RGs

}
module "virtual_network" {
  source     = "../../Child_modules/Azurerm_virtual_network"
  Vnets      = var.Vnets
  depends_on = [module.resource_group]
}
module "Subnet" {
  source     = "../../Child_modules/Azurerm_subnet"
  Subnets    = var.Subnets
  depends_on = [module.virtual_network]

}
module "Public_IP" {
  source     = "../../Child_modules/azurerm_PIPs"
  PIPs       = var.PIPs
  depends_on = [module.resource_group]
}
module "network_interface" {
  source     = "../../Child_modules/Azurerm_Nics"
  Nics       = var.Nics
  depends_on = [module.Subnet,module.resource_group]

}
module "bastion" {
  source     = "../../Child_modules/azurerm_bastion"
  bastion    = var.bastion
  depends_on = [module.Public_IP, module.Subnet]
}
module "Virtual_machine" {
  source     = "../../Child_modules/Azurerm_virtual_machin"
  VMs        = var.VMs
  depends_on = [module.network_interface]

}