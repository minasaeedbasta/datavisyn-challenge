resource "kubernetes_manifest" "cluster_issuer" {
  manifest = yamldecode(data.template_file.clusterissuer.rendered)
}

data "template_file" "clusterissuer" {
  template = file("${path.module}/templates/cluster_issuer.tpl")
}