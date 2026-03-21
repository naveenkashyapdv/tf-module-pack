variable "identifier" { type = string }
variable "engine" { type = string }
variable "engine_version" { type = string }
variable "instance_class" { type = string }
variable "allocated_storage" { type = number }
variable "db_name" { type = string }
variable "username" { type = string }
variable "password" { type = string sensitive = true }
variable "subnet_ids" { type = list(string) }
variable "vpc_security_group_ids" { type = list(string) default = [] }
variable "publicly_accessible" { type = bool default = false }
variable "skip_final_snapshot" { type = bool default = true }
variable "deletion_protection" { type = bool default = false }
variable "tags" { type = map(string) default = {} }
