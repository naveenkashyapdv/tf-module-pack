variable "name" {
  type = string


}
variable "subnet_ids" {
  type = list(string)


}
variable "min_size" {
  type    = number
  default = 1


}
variable "max_size" {
  type    = number
  default = 2


}
variable "desired_capacity" {
  type    = number
  default = 1


}
variable "launch_template_id" {
  type = string


}
variable "launch_template_version" {
  type    = string
  default = "$Latest"


}
variable "tags" {
  type = map(string)
  default = {
  }

}
