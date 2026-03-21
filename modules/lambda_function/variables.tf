variable "function_name" { type = string }
variable "role_arn" { type = string }
variable "handler" { type = string default = "lambda_function.lambda_handler" }
variable "runtime" { type = string default = "python3.12" }
variable "filename" { type = string }
variable "timeout" { type = number default = 30 }
variable "memory_size" { type = number default = 128 }
variable "environment_variables" { type = map(string) default = {} }
variable "tags" { type = map(string) default = {} }
