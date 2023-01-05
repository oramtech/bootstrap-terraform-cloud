resource "github_repository" "iac_watchtower" {
  name = "iac-watchtower"
  visibility = "public"
  has_issues = true
  has_projects = false
  has_wiki = false
  delete_branch_on_merge = true
  license_template = "gpl-3.0"
}

resource "tfe_workspace" "iac_watchtower" {
  name = "iac-watchtower"
  organization = tfe_organization.oramtech.name
  execution_mode = "remote"
}

resource "tfe_workspace_variable_set" "iac_watchtower_dockertcp" {
  variable_set_id = tfe_variable_set.dockertcp_kiowa.id
  workspace_id    = tfe_workspace.iac_watchtower.id
}