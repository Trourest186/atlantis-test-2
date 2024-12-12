terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.0.0"
    }
  }

  backend "gcs" {
    bucket = "tiliter-terraform-iac" # need create before
    prefix = "gcp/management/production"
  }
}

provider "google" {
  project = "tiliter-production" # need change
  region  = "australia-southeast1"
  zone    = "australia-southeast1-a"
}