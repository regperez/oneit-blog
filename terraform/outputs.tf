output "instance_name" {
  value = google_compute_instance.vm_blog.name
}

output "external_ip" {
  value = google_compute_instance.vm_blog.network_interface[0].access_config[0].nat_ip
}

