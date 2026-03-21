variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "project" {
  type        = string
  description = "Project or application name"
  default     = "demo"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "db_password" {
  type        = string
  description = "RDS master password"
  sensitive   = true
}
