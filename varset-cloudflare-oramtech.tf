variable "cloudflare_account_id" {
  type = string
}

variable "cloudflare_api_token" {
  type = string
}

variable "cloudflare_dns_zone_id" {
  type = string
}

resource "tfe_variable_set" "cloudflare" {
  name          = "cloudflare_tunnel_token"
  description   = "Cloudflare token for setting up tunnel connections"
  organization  = tfe_organization.oramtech.name
}

resource "tfe_variable" "cloudflare_account_id" {
  key = "cloudflare_account_id"
  description = "Account Id for our Cloudflare Zero Trust aka Access domain"
  category = "terraform"
  variable_set_id = tfe_variable_set.cloudflare.id
  value = var.cloudflare_account_id
  sensitive = true
}

resource "tfe_variable" "cloudflare_api_token" {
  key = "cloudflare_api_token"
  description = "Secret token to access the Cloudflare API"
  category = "terraform"
  variable_set_id = tfe_variable_set.cloudflare.id
  value = var.cloudflare_api_token
  sensitive = true
}

resource "tfe_variable" "cloudflare_dns_zone_id" {
  key = "cloudflare_dns_zone_id"
  description = "Cloudflare Zone Id for DNS"
  category = "terraform"
  variable_set_id = tfe_variable_set.cloudflare.id
  value = var.cloudflare_dns_zone_id
  sensitive = true
}