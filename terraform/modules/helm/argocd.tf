resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "8.0.9"
  create_namespace = true

  values = [
    templatefile("${path.module}/values/argocd.yaml.tmpl", {
      client_id     = var.github_client_id
      client_secret = var.github_client_secret
    })
  ]

  depends_on = [ helm_release.ingress_nginx ]
}
