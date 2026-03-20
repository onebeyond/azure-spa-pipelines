locals {
  stage_code = lower(terraform.workspace)
  default_tags = {
    stage = local.stage_code
    managed-by = "terraform"
  }
}