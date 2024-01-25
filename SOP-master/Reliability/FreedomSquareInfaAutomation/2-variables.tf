# Input Variables
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}


variable "public_subnets" {
  type        = list(any)
  description = "List of CIDR blocks assigned to public subnets"
  default     = ["subnet-0d76e1c19021babdc", "subnet-077fb9ce7c582da25", "subnet-0e1d676419f04a72e"]
}

variable "private_subnets" {
  type        = list(any)
  description = "List of cidr blocks for private subnets"
  default     = ["subnet-0fecd510b4e67e4a6", "subnet-0b913b2dd5573b457", "subnet-01d28fd0a156d0e7a"]
}

variable "resource_identifier" {
  type        = string
  description = "Resource identifier"
  default     = "Dev-Freedom"
}


variable "ec2_ami_workernode" {
  description = "AMI ID"
  type        = string
  default     = "ami-0d13caac8ab9d77c3"
}

variable "workernode_count" {
  description = "Workernode Instance Count"
  type        = number
  default     = "3"
}
variable "workernode_instance_type" {
  description = "K8-Clsuter-Instances"
  type        = string
  default     = "t2.medium"
}

variable "k8_master_count" {
  description = "Master Instance Count"
  type        = number
  default     = "1"
}
variable "k8_master_instance_type" {
  description = "K8-Clsuter-Instances"
  type        = string
  default     = "t2.medium"
}