variable "name" {
  type = string


}
variable "ami" {
  type = string


}
variable "instance_type" {
  type = string


}
variable "subnet_id" {
  type = string


}
variable "vpc_security_group_ids" {
  type    = list(string)
  default = []


}
variable "iam_instance_profile" {
  type    = string
  default = null


}
variable "associate_public_ip" {
  type    = bool
  default = false


}
variable "user_data" {
  type    = string
  default = null


}
variable "tags" {
  type = map(string)
  default = {
  }

}
