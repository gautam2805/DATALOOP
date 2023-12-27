# Reference the existing GKE cluster
data "google_container_cluster" "dataloop-test" {
  name     = "dataloop-test"
  project  = "dataloop-assignment-408906"
  location = "asia-south1"
}

data "google_client_config" "current" {}

# Create the "services" namespace
resource "kubernetes_namespace" "services" {
  metadata {
    name = "services"
  }
}

# Create the "monitoring" namespace
resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

resource "kubernetes_manifest" "nginx_deploy" {
  manifest = yamldecode(file(var.nginx_deploy_manifest_path))
}

resource "kubernetes_manifest" "nginx" {
  manifest = yamldecode(file(var.nginx_service_manifest_path))
}