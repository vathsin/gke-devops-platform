resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  deletion_protection = false

  network    = var.network_name
  subnetwork = var.subnet_name
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = var.region
  cluster    = google_container_cluster.gke.name
  node_count = 1

  node_config {
  machine_type = "e2-small"

  disk_size_gb = 20

  disk_type = "pd-standard"

  oauth_scopes = [
    "https://www.googleapis.com/auth/cloud-platform"
  ]
}
}