terraform {
  required_providers {
    tfe = {
      version = "~> 0.41.0"
    }  
    github = {
      source  = "integrations/github" 
    }
  }

  cloud {
    organization = "benoram"

    workspaces {
      name = "bootstrap-terraform-cloud--oramtech"
    }
  }
}

variable "TFE_TOKEN" {
  type = string
}

variable "GITHUB_ORG_TOKEN" {
  type = string
}

provider "tfe" {
  token = var.TFE_TOKEN
}

provider "github" {
  token = "${var.GITHUB_ORG_TOKEN}"
  owner = "oramtech"
}

# Create an organization
resource "tfe_organization" "oramtech" {
  name = "oram-tech"
  email = "b@oram.co"
  collaborator_auth_policy = "two_factor_mandatory"
}