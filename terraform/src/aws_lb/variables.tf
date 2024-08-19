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

variable "internal" {
  description = "If load balancer is internal"
  default     = false
}

variable "port" {
  description = "The port the application is running on"
  type        = number
  default     = 80
}

variable "tg_health_check" {
  description = "The health check details for the target group for the load balancer"
  type = object({
    path                = optional(string, "/")
    interval            = optional(number, 30)
    timeout             = optional(number, 5)
    healthy_threshold   = optional(number, 5)
    unhealthy_threshold = optional(number, 3)
  })
  default = ({
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 3
  })
}

variable "lb_type" {
  description = "Type of load balancer to be created"
  validation {
    condition     = can(regex("^(application|network)", var.lb_type))
    error_message = "Invalid tier selected, only allowed values are: 'application', 'network'"
  }
  default = "application"
}

variable "ssl_policy" {
  description = "The ssl policy being used for the AWS load balancer"
  default     = "ELBSecurityPolicy-2016-08"
}

variable "cert_arn" {
  description = "The certificate to be attached to the load balancer"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the load balancer"
  type        = list(string)
}

variable "enable_deletion_protection" {
  type    = bool
  default = true
}

variable "vpc_id" {
  description = "The vpc in which the resources will be built"
  type        = string
}

variable "protocol" {
  type    = string
  default = "HTTP"
}