provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "test" {
  name     = "${var.name}-rg"
  location = "${var.location}"
}
 
resource "azurerm_virtual_network" "test" {
  name                = "test"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
}
 
resource "azurerm_subnet" "test" {
  name                 = "test-subnet"
  resource_group_name  = azurerm_resource_group.test.name
  virtual_network_name = azurerm_virtual_network.test.name
  address_prefixes     = ["10.0.2.0/24"]
}
 
resource "azurerm_subnet" "test2" {
  name                 = "test-subnet2"
  resource_group_name  = "${azurerm_resource_group.test.name}"
  virtual_network_name = "${azurerm_virtual_network.test.name}"
  address_prefixes       = ["10.0.3.0/24"]
}
 
resource "azurerm_subnet" "test3" {
  name                 = "test-subnet3"
  resource_group_name  = "${azurerm_resource_group.test.name}"
  virtual_network_name = "${azurerm_virtual_network.test.name}"
  address_prefixes       = ["10.0.4.0/24"]
}
 
resource "azurerm_network_interface" "test" {
  name                = "test"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  ip_configuration {
    name                          = "config1"
    subnet_id                     = "${azurerm_subnet.test.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "test2" {
  name                = "test2"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  ip_configuration {
    name                          = "config2"
    subnet_id                     = "${azurerm_subnet.test2.id}"
    private_ip_address_allocation = "Dynamic"
  }
}
 
resource "azurerm_network_interface" "test3" {
  name                = "test3"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  ip_configuration {
    name                          = "config3"
    subnet_id                     = "${azurerm_subnet.test3.id}"
    private_ip_address_allocation = "Dynamic"
  }
}
 
resource "azurerm_storage_account" "test" {
  name                     = "yassinejdidi25662"
  resource_group_name      = "${azurerm_resource_group.test.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
 
resource "azurerm_storage_container" "test" {
  name                  = "jdidi"
  storage_account_name  = "${azurerm_storage_account.test.name}"
  container_access_type = "private"
}
 
resource "azurerm_virtual_machine" "test" {
  name                  = "jdidi"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.test.name}"
  network_interface_ids = ["${azurerm_network_interface.test.id}"]
  vm_size               = "Standard_B1s"

  os_profile {
    computer_name  = "jdidi"
    admin_username = "${var.username}"
    admin_password = "${var.password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
 
  storage_os_disk {
    name          = "myosdisk1"
    vhd_uri       = "${azurerm_storage_account.test.primary_blob_endpoint}${azurerm_storage_container.test.name}/myosdisk1.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }
 
}
 
resource "azurerm_virtual_machine" "test2" {
  name                  = "jdidi2"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.test.name}"
  network_interface_ids = ["${azurerm_network_interface.test2.id}"]
  vm_size               = "Standard_B1s"
  os_profile {
    computer_name  = "jdidi2"
    admin_username = "${var.username}"
    admin_password = "${var.password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
 
  storage_os_disk {
    name          = "myosdisk2"
    vhd_uri       = "${azurerm_storage_account.test.primary_blob_endpoint}${azurerm_storage_container.test.name}/myosdisk2.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }
}
 
resource "azurerm_virtual_machine" "test3" {
  name                  = "jdidi3"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.test.name}"
  network_interface_ids = ["${azurerm_network_interface.test3.id}"]
  vm_size               = "Standard_B1s"

   os_profile {
    computer_name  = "jdidi2"
    admin_username = "${var.username}"
    admin_password = "${var.password}"
  }

   os_profile_linux_config {
    disable_password_authentication = false
  }

   storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

   storage_os_disk {
    name          = "myosdisk3"
    vhd_uri       = "${azurerm_storage_account.test.primary_blob_endpoint}${azurerm_storage_container.test.name}/myosdisk3.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

}