resource "github_repository" "iac_homarr" {
  name = "iac-homarr"
  template {
    owner = "oramtech"
    repository = "iac_repo_template"
  }

  lifecycle {   
    prevent_destroy = true 
  }
}

resource "github_repository_file" "main_tf_homarr" {
  repository = github_repository.iac_homarr.name
  file = "main.tf"
  content = templatefile("./templates/iac_repo/main.tf.tftpl", {
    tfe_org = "oramtech",
    tfe_workspace = "iac-homarr", 
    include_cloudflare = true
  })
  commit_author = "Ben Oram"
  commit_email = "b@oram.co"
}

resource "github_repository_file" "devcontainer_json_homarr" {
  repository = github_repository.iac_homarr.name
  file = ".devcontainer/devcontainer.json"
  content = templatefile("./templates/iac_repo/.devcontainer/devcontainer.json.tftpl", {})
  commit_author = "Ben Oram"
  commit_email = "b@oram.co"
}

resource "github_repository_file" "generated_variables_tf_homarr" {
  repository = github_repository.iac_homarr.name
  file = "generated-variables.tf"
  content = templatefile("./templates/iac_repo/generated-variables.tf.tftpl", {
    tfe_org = "oramtech",
    tfe_workspace = "iac-homarr", 
    include_cloudflare = true    
  })
  commit_author = "Ben Oram"
  commit_email = "b@oram.co"
}

resource "github_repository_file" "readme_md_homarr" {
  repository = github_repository.iac_homarr.name
  file = "README.md"
  content = templatefile("./templates/iac_repo/README.md.tftpl", {
    tfe_org = "oramtech",
    tfe_workspace = "iac-homarr", 
    include_cloudflare = true
  })
  commit_author = "Ben Oram"
  commit_email = "b@oram.co"
}

resource "tfe_workspace" "iac_homarr" {
  name = "iac-homarr"
  organization = tfe_organization.oramtech.name
  execution_mode = "remote"

  lifecycle {   
    prevent_destroy = true 
  }
}

resource "tfe_workspace_variable_set" "iac_homarr_dockertcp" {
  variable_set_id = tfe_variable_set.dockertcp_kiowa.id
  workspace_id    = tfe_workspace.iac_homarr.id
}

resource "tfe_workspace_variable_set" "iac_homarr_cloudflare" {
  variable_set_id = tfe_variable_set.cloudflare.id
  workspace_id    = tfe_workspace.iac_homarr.id
}
