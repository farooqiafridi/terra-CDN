
"AWS_REGION" {
default = "us-west-2"
}
variable "AWS_ACCESS_KEY" {
    default = "AKIA276Q7FL5FL5233PA"
}
variable "AWS_SECRET_KEY" {}
variable "name" {
    default = ""
}
variable "ECS" {
    default = "ecs-ysquare"
}

variable "INSTANCE_TYPE-1" {
  default = "t3.micro"
}
variable "INSTANCE_TYPE-2" {
  default = "t3.small"
}
variable "ENVIRONMENT" {
  description = "AWS VPC Environment Name"
  type        = string
  default     = "dev"
}

variable "private-1" {
  description = "AWS VPC Environment Name"
  type        = string
  default     = "10.99.0.0/24"
}
variable "private-2" {
  description = "AWS VPC Environment Name"
  type        = string
  default     = "10.99.1.0/24"
}
variable "private-3" {
  type        = string
  default     = "10.99.2.0/24"
}
variable "pub-1" {
  description = "AWS VPC Environment Name"
  type        = string
  default     = "10.99.3.0/24"
}
variable "pub-2" {
  description = "AWS VPC Environment Name"
  type        = string
  default     = "10.99.4.0/24"
}
variable "pub-3" {
  description = "AWS VPC Environment Name"
  type        = string
  default     = "10.99.5.0/24"
}



variable "max" {
  description = "instance"
  type        = string
  default     = "2"
}
variable "cidr" {
  description = "instance"
  type        = string
  default     = "10.99.0.0/18"
}