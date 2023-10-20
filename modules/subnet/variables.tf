variable "name" {
  description = "The name of the subnetwork."
  default = "my-project"
}

variable "network_name" {
  description = "The name of the parent network."
}

variable "region" {
  description = "The region where the subnetwork should be created."
}

variable "project" {
  description = "The ID of the GCP project."
}

variable "ip_cidr_range" {
  description = "The IP CIDR range for the subnetwork."
}
