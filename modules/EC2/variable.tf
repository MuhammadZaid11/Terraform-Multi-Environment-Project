variable "env" {
    description = "Enivronment name (from terraform workspace)"
    type = string
}



variable "key_name" {   
    description = "Name of the key pair to be created"
    type        = string
  
}

variable "public_key_path" {
    description = "Path to the public key file"
    default = ""
  
}

variable "ami" {
    description = "Ami ID for the Ec2 instance"
    type = string
  
}

variable "instance_type" {
    description = "Instance type for the Ec2 instance"
    type = string
  

}

variable "instance_count" {
    description = "Number of Ec2 instances to be created"
    type = number
  
}

variable "common_tags" {
    description = "Common tags to be applied to all resources"
    type = map(string)
    default = {
    }
  
}