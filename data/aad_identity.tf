resource "helm_release" "aad-pod-identity" {
  name              = "aad-pod-identity"
  repository        = "https://raw.githubusercontent.com/Azure/aad-pod-identity/master/charts"
  chart             = "aad-pod-identity"
  version           = var.aad_pod_chart_version
  namespace         = var.aad_pod_release_namespace
  # create_namespace  = "true"

  set {
    name  = "nmi.priorityClassName"
    value = "system-node-critical"
  }

  set {
    name  = "mic.priorityClassName"
    value = "system-node-critical"
  }

  set {
    name  = "mic.resources.limits.cpu"
    value = "300m"
  }

  set {
    name  = "mic.resources.requests.cpu"
    value = "200m"
  }
}
