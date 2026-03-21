variable "name" { type = string }
variable "delay_seconds" { type = number default = 0 }
variable "visibility_timeout_seconds" { type = number default = 30 }
variable "message_retention_seconds" { type = number default = 345600 }
variable "kms_master_key_id" { type = string default = null }
variable "tags" { type = map(string) default = {} }
