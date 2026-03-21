variable "name" {
  type = string


}
variable "cidr_block" {
  type = string


}
variable "availability_zones" {
  type = list(string)


}
variable "public_subnet_cidrs" {
  type = list(string)


}
variable "private_subnet_cidrs" {
  type = list(string)


}
variable "enable_dns_support" {
  type    = bool
  default = true


}
variable "enable_dns_hostnames" {
  type    = bool
  default = true


}
variable "tags" {
  type = map(string)
  default = {
  }

}
