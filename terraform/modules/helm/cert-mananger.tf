resource "helm_release" "cert_manager" {
  name = "cert-manager"

  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  version          = "v1.17.2"

  values = [file("${path.module}/values/cert-manager.yaml")]

  depends_on = [helm_release.ingress_nginx]
}