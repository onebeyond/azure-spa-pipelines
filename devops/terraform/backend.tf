terraform {
  backend "azurerm" {
    resource_group_name  = "spa-infra-rg"
    storage_account_name = "spainfrastorage"
    container_name       = "spa-infra"
    key                  = "spa-infra-${local.stage_code}.tfstate"
  }
}