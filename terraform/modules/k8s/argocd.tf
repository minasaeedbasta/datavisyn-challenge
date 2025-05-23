resource "kubernetes_manifest" "argo_root_app" {
  manifest = yamldecode(data.template_file.argo_root_app.rendered)
}

data "template_file" "argo_root_app" {
  template = file("${path.module}/templates/argo_root_app.tpl")
}
