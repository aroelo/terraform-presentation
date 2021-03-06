terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.17.0"
    }
  }

  cloud {
    organization = "data-eng-meetup"

    workspaces {
      name = "demo"
    }
  }
}

provider "google" {
  credentials = var.google_credentials

  project = "terraform-demo-347613"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}