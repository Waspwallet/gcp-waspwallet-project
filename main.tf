provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name     = "waspwallet-cluster"
  location = var.region

  initial_node_count = 3

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  workload_identity_config {
    identity_namespace = "${var.project_id}.svc.id.goog"
  }
}

output "kubeconfig" {
  value = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
}
