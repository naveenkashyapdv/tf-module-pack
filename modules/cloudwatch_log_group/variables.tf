variable "name" { type = string }
variable "retention_in_days" { type = number default = 30 }
variable "kms_key_id" { type = string default = null }
variable "tags" { type = map(string) default = {} }
