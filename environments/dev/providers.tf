terraform {
  backend "gcs" {
    bucket = "gke-terraform-state-dev-vathsin-496016"
    prefix = "dev"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "mycompany-dev-496016"
  region  = "us-central1"
}