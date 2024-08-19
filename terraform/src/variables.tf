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
  default     = "sandbox"
}

variable "desired_capacity" {
  description = "Desired number of instances in the ASG to start with"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances in the ASG can scale to"
  type        = number
  default     = 1
}

variable "min_size" {
  description = "Minimum number of instances in the ASG should have running always"
  type        = number
  default     = 1
}

variable "ami_id" {
  description = "AMI to be used for the app server instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the app server"
  type        = string
  default     = "t2.micro"
}

variable "user_date" {
  description = "User data to start the app server on instance launch or startup"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to be applied to every resources"
  type        = map(string)
}

variable "cert_arn" {
  description = "The certificate to be attached to the load balancer"
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of the KMS key used to encrypt database. Required if storage encrypted is true"
  default     = ""
}

variable "kms_key_id" {
  description = "KMS key to manage the master password in secret manager"
  type        = string
  default     = ""
}
