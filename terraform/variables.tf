
variable "region" {
  description = "AWS region to deploy EC2 instance"
  type        = string
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "AWS key pair name for SSH access"
  type        = string
}

variable "ingressFromPort" {
  description = "Ingress rule starting port"
  type        = number
}

variable "ingressToPort" {
  description = "Ingress rule ending port"
  type        = number
}

variable "egressFromPort" {
  description = "Egress rule starting port"
  type        = number
}

variable "egressToPort" {
  description = "Egress rule ending port"
  type        = number
}
