variable "aws_region" {
  type    = string
  default = "us-east-1"


}
variable "project_name" {
  type    = string
  default = "demoapp"


}
variable "ami_id" {
  type    = string
  default = "ami-1234567890abcdef0"


}
variable "db_password" {
  type      = string
  sensitive = true


}
