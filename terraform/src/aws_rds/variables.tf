variable "name" {
  description = "Unique name for the app server"
  type        = string
}

variable "env" {
  description = "Environment in which the app server is being deployed"
  type        = string
}

variable "tier" {
  description = "Tier in which it is being deployed"
  validation {
    condition     = can(regex("^(sandbox|nonprod|prod)", var.tier))
    error_message = "Invalid tier selected, only allowed values are: 'sandbox', 'nonprod', 'prod'"
  }
}

variable "tags" {
  description = "Tags to be applied to every resources"
  type        = map(string)
}

variable "kms_key_id" {
  description = "KMS key to manage the master password in secret manager"
  type        = string
}

variable "db_engine" {
  description = "The type of RDS instance being used"
  default     = "postgres"
}

variable "db_engine_version" {
  default = "16.4-R1"
}

variable "db_storage" {
  description = "Storage allocated for the RDS instance"
  default     = 10
}

variable "db_max_allocated_storage" {
  description = "Storage allocated for the RDS instance"
  default     = 100
}

variable "instance_class" {
  description = "Instance Class to be used for the RDS instance"
  default     = "db.t3.micro"
}

variable "subnet_ids" {
  description = "Subnet IDs for the app server"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID to be used for the resources"
}

variable "maintenance_window" {
  description = "The window to perform maintenance in"
  default     = "Sat:17:00-Sat:20:00"
}

variable "deletion_protection" {
  description = "If the DB instance should have deletion protection enabled"
  default     = true
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  default     = 20
}

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created"
  default     = "13:00-16:00"
}

variable "kms_key_arn" {
  description = "ARN of the KMS key used to encrypt database. Required if storage encrypted is true"
  default     = ""
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  default     = true
}