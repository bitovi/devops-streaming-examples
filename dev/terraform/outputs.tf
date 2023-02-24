output "instance_public_dns" {
  description = "Public DNS address of the GCP VM instance"
  #   value       = var.ec2_instance_public_ip ? aws_instance.server.public_dns : "EC2 Instance doesn't have public DNS"
  value = google_compute_instance.gcp_instance.network_interface[0].access_config[0].nat_ip
}

output "instance_id" {
  description = "ssh'able name of the instance"
  value       = google_compute_instance.gcp_instance.id
}

output "bucket_name" {
  value = google_storage_bucket.default.name
}

output "vpc" {
  value = google_compute_network.vpc_network.name
}

output "machine_type" {
  value = google_compute_instance.gcp_instance.machine_type
}

output "zone" {
  value = google_compute_instance.gcp_instance.zone
}

output "disk_size" {
  value = google_compute_instance.gcp_instance.boot_disk[0].initialize_params[0].size
}

output "project" {
  value = google_compute_instance.gcp_instance.network_interface[0].subnetwork_project
}