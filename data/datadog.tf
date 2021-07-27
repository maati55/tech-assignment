resource "helm_release" "datadog" {
  name              = "datadog"
  repository        = "https://helm.datadoghq.com"
  chart             = "datadog"
  version           = var.datadog_chart_version
  namespace         = var.datadog_release_namespace
  create_namespace  = "true"

  # values = [
  #   file("../charts/datadog/values.yaml")
  # ]

  set {
    name  = "datadog.site"
    value = var.datadog_site
  }

  set {
    name  = "datadog.apiKey"
    value = var.datadog_apiKey
  }

  set {
    name  = "clusterAgent.enabled"
    value = "true"
  }

  set {
    name  = "clusterAgent.metricsProvider.enabled"
    value = "true"
  }

  set {
    name  = "datadog.logs.enabled"
    value = "true"
  }

  set {
    name  = "datadog.containerCollectAll"
    value = "true"
  }

  set {
    name  = "clusterChecksRunner.enabled"
    value = "true"
  }

}
