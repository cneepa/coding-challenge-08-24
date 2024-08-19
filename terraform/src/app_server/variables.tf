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

variable "subnet_ids" {
  description = "Subnet IDs for the app server"
  type        = list(string)
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

variable "target_group_arns" {
  description = "ARNS of the target group the AGS is associated with"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI to be used for the app server instance"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to every resources"
  type        = map(string)
}

variable "instance_type" {
  description = "Instance type for the app server"
  type        = string
  default     = "t2.micro"
}

variable "user_date" {
  description = "User data to start the app server on instance launch or startup"
  type        = string
}

variable "vpc_id" {
  description = "The vpc i nwhic the resources will be built"
  type        = string
}