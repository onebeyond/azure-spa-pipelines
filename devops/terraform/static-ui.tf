resource "azurerm_resource_group" "stage" {
    name     = "${var.application_name}-${local.stage_code}-rg"
    location = var.resource_location
    tags     = local.default_tags
}


resource "azurerm_static_web_app" "ui" {
  name                = "${var.application_name}-${local.stage_code}-spa"
  resource_group_name = azurerm_resource_group.stage.name
  location            = var.resource_location
  sku_size            = var.web_ui_sku_size
  sku_tier            = var.web_ui_sku_size
  tags                = local.default_tags
  lifecycle {
    ignore_changes = [ 
      repository_branch,
      repository_url,
      tags["Billing-group"]
     ]
  }
}

resource "azurerm_static_web_app_custom_domain" "domain" {
  count = var.has_custom_domain ? 1 : 0
  domain_name = var.web_ui_url
  static_web_app_id = azurerm_static_web_app.ui.id
  validation_type = "cname-delegation"
}