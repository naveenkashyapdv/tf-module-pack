variable "name_prefix" {
  type = string


}
variable "image_id" {
  type = string


}
variable "instance_type" {
  type    = string
  default = "t3.micro"


}
variable "key_name" {
  type    = string
  default = null


}
variable "security_group_ids" {
  type    = list(string)
  default = []


}
variable "user_data_base64" {
  type    = string
  default = null


}
variable "device_name" {
  type    = string
  default = "/dev/xvda"


}
variable "volume_size" {
  type    = number
  default = 20


}
variable "volume_type" {
  type    = string
  default = "gp3"


}
variable "tags" {
  type = map(string)
  default = {
  }

}
