data "google_compute_network" "parent_network" {
  name = var.network_name
  project = var.project
}

resource "google_compute_subnetwork" "subnetwork" {
  name = var.name
  region = var.region
  network = data.google_compute_network.parent_network.self_link
  ip_cidr_range = var.ip_cidr_range
}
