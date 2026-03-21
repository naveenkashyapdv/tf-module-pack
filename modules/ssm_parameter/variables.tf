variable "name" {
  type = string


}
variable "type" {
  type    = string
  default = "SecureString"


}
variable "value" {
  type      = string
  sensitive = true


}
variable "tier" {
  type    = string
  default = "Standard"


}
variable "tags" {
  type = map(string)
  default = {
  }

}
