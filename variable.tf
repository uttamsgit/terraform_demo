variable "ec2_instance_type" {
  description = "The type of instance to create"
  default     = "m7i-flex.large"
  type       = string
}

variable "aws_instance_count" {
  description = "The number of instances to create"
  default     = 1
  type       = number
}
variable "ec2_ami_id" {
  description = "The AMI ID to use for the instance"
  default     = "ami-06468be052a4195a6" # ubuntu 22.04 LTS in eu-west-1
  type       = string
}
variable "aws_key_name" {
  description = "The name of the key pair to use for the instance"
  default     = "my-key"
  type       = string
}

variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "eu-west-1"
  type       = string
}

variable "ec2_root_volume_size" {
  description = "The size of the root volume in GB"
  default = 15
  type = number
}
