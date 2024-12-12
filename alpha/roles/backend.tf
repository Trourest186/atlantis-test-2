terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.0.0"
    }
  }

  backend "gcs" {
    bucket = "tiliter-terraform-iac" # need create before
    prefix = "gcp/management/alpha/roles"
  }
}

provider "google" {
  project = "tiliter-alpha" # need change
  region  = "australia-southeast1"
  zone    = "australia-southeast1-a"
}