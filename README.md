# Bootstrap-Terraform-Cloud

Designed to be used from Codespaces, this repo bootstraps the "oramtech" organization in Terraform Cloud by

- Creating the Organization
- Creating key variable sets
- Creating workspaces and GitHub repositories for every infrastructure as code repo "IAC-*"

The GitHub repositories that are created come with a generated README, main.tf and generated-variables.tf file. Once the repo exists, you can use it from codespaces to add docker containers and cloudflare access tunnel and app configurations.

For now, this repo and subsequent generated repos are used to stand up services in my homelab environment.

## Usage

From CodeSpaces, use terraform validate/plan/apply workflow