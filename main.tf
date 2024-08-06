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

  enable_legacy_abac = false
  enable_private_nodes = true
  enable_master_authorized_networks = true
  enable_ip_alias = true
  enable_default_service_account = false
  enable_resource_labels = true
  enable_network_policy = true
}

provider "google" {
  project = var.project_id
  region  = var.region
  version = "~> 3.0"
}

output "kubeconfig" {
  value = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
}
