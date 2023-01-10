terraform {
  required_providers {
    tfe = {
      version = "~> 0.41.0"
    }  
    github = {
      source  = "integrations/github" 
      version = "5.9.0"
      //Pinning to an old version as through 5.13 at least there is an issue
      // https://github.com/integrations/terraform-provider-github/issues/1466
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
  
  lifecycle {   
    prevent_destroy = true 
  }
}