# resource "helm_release" "datadog" {
#   name              = "datadog"
#   chart             = "../charts/datadog"
#   version           = var.datadog_chart_version
#   dependency_update = "true"
#   namespace         = var.datadog_release_namespace
#   create_namespace  = "true"
#   # force_update      = true
#
#   # values = [
#   #   "${file("values.yaml")}"
#   # ]
#
#   set {
#     name  = "elasticsearch.version"
#     value = var.datadog_version
#   }
#
# }
