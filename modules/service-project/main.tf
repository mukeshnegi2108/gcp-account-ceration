resource "google_project" "my_project" {
  name       = var.project_name
  project_id = var.project_name
}

resource "google_project_service" "my_project_services" {
  project = google_project.my_project.project_id
  service = "compute.googleapis.com" # Example service, add more as needed
}

resource "google_project_billing_info" "my_project_billing" {
  project = google_project.my_project.project_id
  billing_account = var.billing_account
}

# Add more resource configurations as needed
