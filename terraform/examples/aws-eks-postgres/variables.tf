variable "region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "image_repository" {
  description = "Bifrost image repository. Enterprise: the registry path issued for your organization."
  type        = string
  default     = "maximhq/bifrost"
}

variable "image_tag" {
  description = "Bifrost image tag. Pin a released version for production."
  type        = string
  default     = "latest"
}

variable "name_prefix" {
  description = "Prefix for all resource names."
  type        = string
  default     = "bifrost"
}

variable "kubeconfig_path" {
  description = "Kubeconfig the kubernetes provider reads. deploy/eks/deploy.sh writes it with aws eks update-kubeconfig after the cluster exists."
  type        = string
  default     = "~/.kube/config"
}

variable "kubeconfig_context" {
  description = "Kubeconfig context to use. Null uses the current context."
  type        = string
  default     = null
}

# --- Cluster ---

variable "node_count" {
  description = "Nodes in the managed node group."
  type        = number
  default     = 2
}

variable "node_machine_type" {
  description = "EC2 instance type for the node group."
  type        = string
  default     = "t3.medium"
}

# --- Database ---

variable "database_instance_class" {
  description = "RDS instance class."
  type        = string
  default     = "db.t4g.small"
}

variable "database_storage_gb" {
  description = "RDS allocated storage in GB."
  type        = number
  default     = 20
}

variable "database_deletion_protection" {
  description = "Protect the database from terraform destroy. Switch it back off and apply before destroying."
  type        = bool
  default     = false
}

variable "database_skip_final_snapshot" {
  description = "Skip the final RDS snapshot on destroy. Set false to keep one named <name_prefix>-db-final; independent of deletion protection."
  type        = bool
  default     = true
}

# --- Access ---

variable "enforce_auth_on_inference" {
  description = "Require a virtual key on inference routes. Keep true while the load balancer is public."
  type        = bool
  default     = true
}

variable "allowed_cidr" {
  description = "CIDR allowed to reach the cluster endpoint and nodes. Narrow this for production."
  type        = string
  default     = "0.0.0.0/0"
}

variable "providers_config" {
  description = "Optional LLM provider configuration written to config.json."
  type        = any
  default     = null
  sensitive   = true
}

# --- Compute ---

variable "cpu" {
  description = "CPU request in millicores."
  type        = number
  default     = 1000
}

variable "memory" {
  description = "Memory request in MB."
  type        = number
  default     = 2048
}

variable "tags" {
  description = "Tags applied to every resource."
  type        = map(string)
  default     = { app = "bifrost" }
}
