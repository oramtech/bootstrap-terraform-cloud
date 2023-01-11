resource "github_repository" "iac_portainer" {
  name = "iac-portainer"
  template {
    owner = "oramtech"
    repository = "iac_repo_template"
  }

  lifecycle {   
    prevent_destroy = true 
  }
}

resource "github_repository_file" "main_tf_portainer" {
  repository = github_repository.iac_portainer.name
  file = "main.tf"
  content = templatefile("./templates/iac_repo/main.tf.tftpl", {
    tfe_org = "oramtech",
    tfe_workspace = "iac-portainer", 
    include_cloudflare = true
  })
  commit_author = "Ben Oram"
  commit_email = "b@oram.co"
}

resource "github_repository_file" "devcontainer_json_portainer" {
  repository = github_repository.iac_portainer.name
  file = ".devcontainer/devcontainer.json"
  content = templatefile("./templates/iac_repo/.devcontainer/devcontainer.json.tftpl", {})
  commit_author = "Ben Oram"
  commit_email = "b@oram.co"
}

resource "tfe_workspace" "iac_portainer" {
  name = "iac-portainer"
  organization = tfe_organization.oramtech.name
  execution_mode = "remote"

  lifecycle {   
    prevent_destroy = true 
  }
}

resource "tfe_workspace_variable_set" "iac_portainer_dockertcp" {
  variable_set_id = tfe_variable_set.dockertcp_kiowa.id
  workspace_id    = tfe_workspace.iac_portainer.id
}

resource "tfe_workspace_variable_set" "iac_portainer_cloudflare" {
  variable_set_id = tfe_variable_set.cloudflare.id
  workspace_id    = tfe_workspace.iac_portainer.id
}
