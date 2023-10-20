data "google_projects" "existing_projects" {
  filter = "project_id: *"
#   region = "us-central1" # Change to your desired region
}

data "google_compute_network" "network" {
  name    = "your-network-name"
  project = "your-existing-project"
}

data "google_compute_subnetwork" "subnetwork" {
  name      = "your-subnetwork-name"
  project   = "your-existing-project"
  region    = "us-central1" # Change to your desired region
}

locals {
  project_exists   = contains(data.google_projects.existing_projects.project, "your-service-project-id")
  network_exists   = data.google_compute_network.network ? true : false
  subnetwork_exists = data.google_compute_subnetwork.subnetwork ? true : false
}

# Create the Service Project if it doesn't exist
module "create_service_project" {
  source          = "path/to/service_project/module"
  project_name    = "your-service-project-name"
  billing_account = "your-billing-account-id"
  count           = local.project_exists ? 0 : 1
}

# Create the Network if it doesn't exist
module "create_network" {
  source   = "path/to/network/module"
  name     = "your-network-name"
  project  = module.create_service_project.project_id
  count    = local.network_exists ? 0 : 1
}

# Create the Subnetwork if it doesn't exist
module "create_subnetwork" {
  source     = "path/to/subnetwork/module"
  name       = "your-subnetwork-name"
  network    = module.create_network.name
  region     = "us-central1" # Change to your desired region
  project    = module.create_service_project.project_id
  count      = local.subnetwork_exists ? 0 : 1
}
