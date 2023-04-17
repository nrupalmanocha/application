terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">1"
    }
  }
}
provider azurerm {
  # Configuration options
  features {}

  client_id       = "e0fd4ec1-54e5-4a0c-bb3e-afc21931794d"
  client_secret   =  var.client_secret
  tenant_id       = "361cb8b8-6ecc-4a79-876a-d2af3a45dc3e"
  subscription_id = "2aa9fb54-8dd0-4964-8433-22f674643810"

}




