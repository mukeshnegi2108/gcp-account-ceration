output "project_id" {
  description = "The ID of the provisioned GCP service project"
  value       = google_project.my_project.project_id
}
