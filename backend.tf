terraform {
  backend "azurerm" {
    resource_group_name  = "Dev-RG"
    storage_account_name = "csportalstorageaccount"
    container_name       = "tfstatecontainer"
    key                  = "dev.terraform.tfstate"
  }
} 