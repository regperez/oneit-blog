terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = "blog-flask-oneit"
  region  = "us-east1"
  zone    = "us-east1-b"
}

resource "google_compute_instance" "vm_blog" {
  name         = "vm-blog"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 30
    }
  }

  network_interface {
    network = "default"
    access_config {} # crea IP pública
  }

  metadata = {
    ssh-keys = "${var.vm_user}:${file(var.public_key_path)}"
  }

  tags = ["blog-server"]
}

output "vm_ip" {
  value = google_compute_instance.vm_blog.network_interface[0].access_config[0].nat_ip
}

