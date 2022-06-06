terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.36.0"
    }
  }
}

provider "google" {
  credentials = file(var.credential)

  project = var.project
  region  = "us-central1"
  zone    = "us-central1-b"
}
