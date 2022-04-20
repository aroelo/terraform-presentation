output "vm_instance_name" {
  value       = google_compute_instance.vm_instance.name
  description = "The google compute instance name."
}
