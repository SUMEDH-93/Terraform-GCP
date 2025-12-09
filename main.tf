terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.67.0"
    }
  }
}

provider "google" {
  project = "jenkins-project-480510"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "jenkins_vm" {
  name         = "jenkins-gcp-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Required to assign external IP
    }
  }
}
