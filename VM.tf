resource "azurerm_resource_group" "Nrupal_test" {
  name     = "Nrupal_test"
  location = "Australia East"
}

resource "azurerm_virtual_network" "Nrupal_test_Vnet" {
  name                = "Nrupal_test_Vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.Nrupal_test.location
  resource_group_name = azurerm_resource_group.Nrupal_test.name
}

resource "azurerm_subnet" "Nrupal_test_subnet" {
  name                 = "Nrupal_test_subnet"
  resource_group_name  = azurerm_resource_group.Nrupal_test.name
  virtual_network_name = azurerm_virtual_network.Nrupal_test_Vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "Nrupal_test_NIC" {
  name                = "Nrupal_test_nic"
  location            = azurerm_resource_group.Nrupal_test.location
  resource_group_name = azurerm_resource_group.Nrupal_test.name

  ip_configuration {
    name                          = "Nrupal_test_IP"
    subnet_id                     = azurerm_subnet.Nrupal_test_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "NrupalVM" {
  name                = "NrupalVM"
  resource_group_name = azurerm_resource_group.Nrupal_test.name
  location            = azurerm_resource_group.Nrupal_test.location
  size                = "Standard_F2"
  admin_username      = "0nmanocha"
  admin_password      = "Rough67Tiger"
  network_interface_ids = [
    azurerm_network_interface.Nrupal_test_NIC.id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}