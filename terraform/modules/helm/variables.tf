variable "github_client_id_ssm_path" {
  description = "SSM Parameter Store Path for GitHub OAuth client ID for ArgoCD"
  type        = string
  sensitive = true
}

variable "github_client_secret_ssm_path" {
  description = "SSM Parameter Store Path for GitHub OAuth client secret for ArgoCD"
  type        = string
  sensitive = true
}