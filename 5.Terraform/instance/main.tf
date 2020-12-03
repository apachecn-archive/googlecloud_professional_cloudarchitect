variable "instance_name" {}
variable "instance_zone" {}
variable "project" {}
variable "instance_type" {
  default = "n1-standard-1"
}
variable "instance_network" {}

resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  zone         = var.instance_zone
  machine_type = var.instance_type
  project      = var.project
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = var.instance_network
    access_config {
      # Allocate a one-to-one NAT IP to the instance
    }
  }
}