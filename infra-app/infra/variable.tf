variable "env" {
  description = "This is the env for my infrastructure"
  type        = string
}

variable "bucket_name" {
  description = "This is the bucket name"
  type        = string
}

variable "instance_count" {
  description = "This is the count of the instance"
  type        = number
}

variable "instance_type" {
  description = "This is the type of the instance"
  type        = string
}

variable "ec2_ami_id" {
  default = "ami-07a00cf47dbbc844c"
  type    = string
}

variable "hash_key" {
  description = "This is my infra app hash key"
  type        = string
}
