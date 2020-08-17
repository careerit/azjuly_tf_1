provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.20.0"
  features {}
}


# Create a resource group
resource "azurerm_resource_group" "main" {
  name     = "tf-demo"
  location = "eastus"

  tags = {
      Name  = "tf-demo"
      client = "abc"
      project = "iac"
      created_with = "terraform"
  }
}

# Create a Virtual Network

resource "azurerm_virtual_network" "main" {
  name                = "tfdemo-vnet"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
  
  tags = {
    name = "tfdemo-vnet"
    project = "iac"
    created_with = "terraform"
    
  }
}





output "rg_name" {

    value = azurerm_resource_group.main.name
}




