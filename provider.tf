provider "google" {
  credentials = file("path/to/your/credentials.json")
  project     = "your-existing-project" # This should be an existing project with sufficient permissions.
  region      = "us-central1" # Change to your desired region
}