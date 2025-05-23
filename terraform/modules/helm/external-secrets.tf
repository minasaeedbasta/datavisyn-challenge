# resource "helm_release" "external-secrets" {
#   chart            = var.external_secrets_helm_chart.chart
#   name             = var.external_secrets_helm_chart.name
#   repository       = var.external_secrets_helm_chart.repository
#   namespace        = var.external_secrets_helm_chart.namespace
#   version          = var.external_secrets_helm_chart.version
#   create_namespace = true

#   set {
#     name  = "serviceAccount.create"
#     value = "true"
#   }

#   set {
#     name  = "serviceAccount.name"
#     value = "external-secrets"
#   }

#   set {
#     name  = "serviceAccount.annotations.iam\\.gke\\.io/gcp-service-account"
#     value = "var.external_secrets_sa"
#   }

#   set {
#     name  = "installCRDs"
#     value = true
#   }

# }
