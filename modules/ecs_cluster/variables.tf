variable "name" { type = string }
variable "container_insights_enabled" { type = bool default = true }
variable "tags" { type = map(string) default = {} }
