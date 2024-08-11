variable "project_id" {
  description = "The project ID to host the cluster in"
  type        = string
}

variable "region" {
  description = "The region to host the cluster in"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone to host the cluster in"
  type        = string
  default     = "us-central1-a"
}

#variable "credentials_file" {
#  description = "The path to the GCP credentials JSON file"
#  default     = "~/.config/gcloud/terraform-admin.json"
#}
