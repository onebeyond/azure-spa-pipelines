variable "resource_location" {
    type        = string
    description = "Moniker of location which is used for placing the stage resources in. For exaple, \"uksouth\", \"canadacentral\"."
    validation {
      condition     = length(var.resource_location) > 0 # Ideally should be checked against a list of possible locations via data source
      error_message = "Stage location moniker should be a non-empty string like \"uksouth\", \"canadacentral\"."
  }
}

variable "web_ui_sku_size" {
  type        = string
  description = "SKU for Static UI."
}

variable "has_custom_domain"{
  type        = bool
  description = "set to true if you have a custom domain"
  nullable    = false
  default     = false
}

variable "web_ui_url" {
  type        = string
  description = "URL of UI - unfortunate bootstrap problem - required if has_custom_domain is true"
  nullable    = true
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID of deployed env"
}

variable "application_name" {
  type        = string
  description = "Name of the Application"
}