resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "8.0.9"
  create_namespace = true

  values = [file("${path.module}/values/argocd.yaml")]

  depends_on = [helm_release.ingress_nginx]
}
