resource "helm_release" "ingress_nginx" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  version          = "4.12.2"
  create_namespace = true

  values = [file("${path.module}/values/ingress-nginx.yaml")]

}
