variable "dockertcp_ca_material" {
  type = string
}

variable "dockertcp_cert_material" {
  type = string
}

variable "dockertcp_key_material" {
  type = string
}

variable "dockertcp_host" {
  type = string
}

resource "tfe_variable_set" "dockertcp_kiowa" {
  name          = "dockertcp_kiowa"
  description   = "Docker TCP certificate settings for Kiowa host"
  organization  = tfe_organization.oramtech.name
}

resource "tfe_variable" "dockertcp_host_kiowa" {
  key = "dockertcp_host"
  description = "tcp url. Will be accessed by Terraform Cloud"
  category = "terraform"
  variable_set_id = tfe_variable_set.dockertcp_kiowa.id
  value = var.dockertcp_host
  sensitive = true
}

resource "tfe_variable" "dockertcp_ca_material_kiowa" {
  key = "dockertcp_ca_material" 
  category = "terraform"
  variable_set_id = tfe_variable_set.dockertcp_kiowa.id
  value = var.dockertcp_ca_material
  sensitive = true
}

resource "tfe_variable" "dockertcp_cert_material_kiowa" {
  key = "dockertcp_cert_material" 
  category = "terraform"
  variable_set_id = tfe_variable_set.dockertcp_kiowa.id
  value = var.dockertcp_cert_material
  sensitive = true
}

resource "tfe_variable" "dockertcp_key_material_kiowa" {
  key = "dockertcp_key_material" 
  category = "terraform"
  variable_set_id = tfe_variable_set.dockertcp_kiowa.id
  value = var.dockertcp_key_material
  sensitive = true
}