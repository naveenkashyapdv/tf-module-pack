variable "description" {
  type    = string
  default = "Managed by Terraform"


}
variable "deletion_window_in_days" {
  type    = number
  default = 7


}
variable "enable_key_rotation" {
  type    = bool
  default = true


}
variable "alias_name" {
  type    = string
  default = null


}
variable "tags" {
  type = map(string)
  default = {
  }

}
