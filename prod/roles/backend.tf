terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.0.0"
    }
  }

  backend "gcs" {
    bucket = "sotabox-trourest" # need create before
    prefix = "gcp/management/prod/roles"
  }
}

provider "google" {
  project = "dev-sota-data-platform" # need change
  region  = "australia-southeast1"
  zone    = "australia-southeast1-a"
}