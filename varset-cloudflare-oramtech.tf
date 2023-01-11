variable "cloudflare_tunnel_token" {
  type = string
}

resource "tfe_variable_set" "cloudflare" {
  name          = "cloudflare_tunnel_token"
  description   = "Cloudflare token for setting up tunnel connections"
  organization  = tfe_organization.oramtech.name
}

resource "tfe_variable" "cloudflare_tunnel_token" {
  key = "cloudflare_tunnel_token"
  description = "Secret token to pass when setting up tunnel"
  category = "terraform"
  variable_set_id = tfe_variable_set.cloudflare.id
  value = var.cloudflare_tunnel_token
  sensitive = true
}