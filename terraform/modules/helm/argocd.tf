resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "8.0.9"
  create_namespace = true

  values = [
    templatefile("${path.module}/values/argocd.yaml.tmpl", {
      client_id     = data.aws_ssm_parameter.github_client_id.value
      client_secret = data.aws_ssm_parameter.github_client_secret.value
    })
  ]

  depends_on = [helm_release.ingress_nginx]
}

data "aws_ssm_parameter" "github_client_id" {
  name            = var.github_client_id_ssm_path
  with_decryption = true
}

data "aws_ssm_parameter" "github_client_secret" {
  name            = var.github_client_secret_ssm_path
  with_decryption = true
}
