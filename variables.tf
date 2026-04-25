variable "ami" {
    description = "AMI ID for EC2 instances"
    type        = string
    default = "ami-0ec10929233384c7f"
}

variable "instance_type" {
    description = "EC2 instance type"
    type        = string
    default = "t3.micro"
}

variable "key_public_path" {
    description = "Path to the public key for EC2 instances"
    type        = string
    default = "key/id_rsa.pub"  
}