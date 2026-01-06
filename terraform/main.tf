resource "kubectl_manifest" "db_secret" {
  yaml_body = file("${path.module}/../k8s/db-secret.yaml")
}

resource "kubectl_manifest" "db_deployment" {
  yaml_body  = file("${path.module}/../k8s/db-deployment.yaml")
  depends_on = [kubectl_manifest.db_secret]
}

resource "kubectl_manifest" "db_service" {
  yaml_body  = file("${path.module}/../k8s/db-service.yaml")
  depends_on = [kubectl_manifest.db_deployment]
}
