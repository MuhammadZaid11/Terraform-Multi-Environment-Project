output "instance_ids" {
    description = "IDs of the EC2 Instance"
    value = aws_instance.my_server_terraform.*.id
}
output "public_ips" {
    description = "Public IPs of the EC2 Instance"
    value = aws_instance.my_server_terraform.*.public_ip
  
}

output "security_group_id" {
    description = "ID of the security group"
    value = aws_security_group.default_vpc.id
  
}