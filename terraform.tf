terraform {
  backend "azurerm" {
    storage_account_name = "stcbseterraformstate"
    container_name       = "terraform-state"
    key                  = "senti-infra.tfstate"
    use_azuread_auth     = true
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"

    }
  }
}
