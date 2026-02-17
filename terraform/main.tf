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

resource "kubectl_manifest" "db_customer_service_secret" {
  yaml_body = file("${path.module}/../k8s/db-customer-service-secret.yaml")
}

resource "kubectl_manifest" "db_customer_service_deployment" {
  yaml_body  = file("${path.module}/../k8s/db-customer-service-deployment.yaml")
  depends_on = [kubectl_manifest.db_customer_service_secret]
}

resource "kubectl_manifest" "db_customer_service_service" {
  yaml_body  = file("${path.module}/../k8s/db-customer-service-service.yaml")
  depends_on = [kubectl_manifest.db_customer_service_deployment]
}

resource "kubectl_manifest" "mongo_db_deployment" {
  yaml_body  = file("${path.module}/../k8s/mongo-db-deployment.yaml")
}

resource "kubectl_manifest" "mongo_db_service" {
  yaml_body  = file("${path.module}/../k8s/mongo-db-service.yaml")
  depends_on = [kubectl_manifest.mongo_db_deployment]
}
