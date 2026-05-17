module "network" {
  source = "../../modules/network"

  vpc_name    = "gke-dev-vpc"
  subnet_name = "gke-dev-subnet"
  subnet_cidr = "10.20.0.0/24"
  region      = "us-central1"
}

module "gke" {
  source = "../../modules/gke"

  cluster_name = "gke-dev-cluster"
  region       = "us-central1"

  network_name = module.network.network_name
  subnet_name  = module.network.subnet_name
}