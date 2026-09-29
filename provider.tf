provider "azurerm" {
  features {
  }
  resource_provider_registrations = "none"
  subscription_id                 = "246fb3a2-71ca-4779-9858-2e92aef6f9e2"
  environment                     = "public"
  use_msi                         = false
  use_cli                         = true
  use_oidc                        = false
}
