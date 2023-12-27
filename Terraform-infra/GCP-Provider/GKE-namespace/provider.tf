# Provider configuration for GCP
provider "google" {
  # Specify your GCP credentials or use other authentication methods
  credentials = file("/Users/goutampattnaik/Downloads/dataloop-assignment-408906-a7caff325a84.json")
  project     = "dataloop-assignment-408906"
  region      = "asia-south1"
}

#Kubernetes provider configuration
provider "kubernetes" {
  #   version                = "2.6.0"
  config_path = "/Users/goutampattnaik/.kube/config"
  host        = data.google_container_cluster.dataloop-test.endpoint
  token       = data.google_client_config.current.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.dataloop-test.master_auth[0].cluster_ca_certificate)
}
