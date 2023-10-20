output "name" {
  description = "The name of the subnetwork."
  value       = google_compute_subnetwork.subnetwork.name
}

output "self_link" {
  description = "The self-link of the subnetwork."
  value       = google_compute_subnetwork.subnetwork.self_link
}