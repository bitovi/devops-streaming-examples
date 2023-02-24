terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      # version = "4.53.1"
    }
  }

  # backend "gcs" {
  #   bucket = "${TF_STATE_BUCKET}"
  #   prefix    = "tf-state"
  #   # encrypt = true #AES-256encryption #TODO confirm gcp syntax
  # }
}
 
# data "gcp_region" "current" {}

provider "google" {
  credentials = file(var.GOOGLE_CREDENTIALS_PATH)
  project = var.GCP_PROJECT_ID
  region  = var.GCP_DEFAULT_REGION
  zone    = var.GCP_DEFAULT_ZONE
  # profile = "default" #TODO is this needed?
  # default_tags {
  #   tags = merge(
  #     local.gcp_tags,
  #     var.additional_tags
  #   )
  # }
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}