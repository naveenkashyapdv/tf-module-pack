variable "name" {
  type = string


}
variable "internal" {
  type    = bool
  default = false


}
variable "subnet_ids" {
  type = list(string)


}
variable "security_group_ids" {
  type    = list(string)
  default = []


}
variable "vpc_id" {
  type = string


}
variable "listener_port" {
  type    = number
  default = 80


}
variable "target_group_port" {
  type    = number
  default = 80


}
variable "target_group_protocol" {
  type    = string
  default = "HTTP"


}
variable "target_type" {
  type    = string
  default = "instance"


}
variable "health_check_path" {
  type    = string
  default = "/"


}
variable "tags" {
  type = map(string)
  default = {
  }

}
