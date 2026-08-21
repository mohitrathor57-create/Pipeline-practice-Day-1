RGs = {
  RG1 = {
    name     = "rg-dev-001"
    location = "centralindia"
  }
  RG2 = {
    name     = "rg-qa-001"
    location = "centralindia"
  }
  RG3 = {
    name     = "rg-test-001"
    location = "centralindia"
  }
}
Vnets = {
  Vnet1 = {
    name                = "vnet-dev-001"
    location            = "centralindia"
    resource_group_name = "rg-dev-001"
    address_space       = ["10.2.0.0/16"]
  }
}

Subnets = {
  Subnet1 = {
    name                 = "forntend-subnet"
    resource_group_name  = "rg-dev-001"
    virtual_network_name = "vnet-dev-001"
    address_prefixes     = ["10.2.1.0/24"]
  }
  Subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-dev-001"
    virtual_network_name = "vnet-dev-001"
    address_prefixes     = ["10.2.2.0/24"]
  }
  Subnet3 = {
    name                 = "database-subnet"
    resource_group_name  = "rg-dev-001"
    virtual_network_name = "vnet-dev-001"
    address_prefixes     = ["10.2.3.0/24"]
  }
  Subnet4 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-dev-001"
    virtual_network_name = "vnet-dev-001"
    address_prefixes     = ["10.2.4.0/28"]
  }
}

PIPs = {
  PIP1 = {
    name                = "pip-dev-001"
    resource_group_name = "rg-dev-001"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

Nics = {
  Nic1 = {
    name                 = "nic-myvm-001"
    location             = "centralindia"
    resource_group_name  = "rg-dev-001"
    nic_subnet_name      = "forntend-subnet"
    virtual_network_name = "vnet-dev-001"
  }
  Nic2 = {
    name                 = "nic-mywindows-002"
    location             = "centralindia"
    resource_group_name  = "rg-dev-001"
    virtual_network_name = "vnet-dev-001"
    nic_subnet_name      = "backend-subnet"
  }
}

bastion = {
  bastion1 = {
    name                   = "bastion-dev-001"
    location               = "centralindia"
    resource_group_name    = "rg-dev-001"
    bastion_subnet_name    = "AzureBastionSubnet"
    virtual_network_name   = "vnet-dev-001"
    bastion_public_ip_name = "pip-dev-001"
  }
}

VMs = {
  VM1 = {
    name                = "vm-linux_machine_001"
    location            = "centralindia"
    resource_group_name = "rg-dev-001"
    vm_size             = "Standard_DS1_v2"
    computer_name       = "linux-VM-001"
    admin_username      = "forntenddeveloper"
    admin_password      = "Mohit@1211"
    vm_nic_name         = "nic-myvm-001"
  }
}
