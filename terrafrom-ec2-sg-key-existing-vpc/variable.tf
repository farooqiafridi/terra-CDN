variable "public_key_path" {
  description = "Public key path"
  default = "~/.ssh/id_rsa.pub"
}

variable "Environment" {
  description = "AWS VPC Environment Name"
  type        = string
  default     = "dev"
}
variable "INSTANCE_TYPE" {
  description = "AWS ECS INSTANCE TYPE"
  type        = string
  default     = "t2.micro"
}
variable "AWS_REGION" {
 
  type        = string
  default     = "us-west-1"
}

