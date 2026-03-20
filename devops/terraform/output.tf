output "static_ui_deployment_token" {
  value     = azurerm_static_web_app.ui.api_key
  sensitive = true
}