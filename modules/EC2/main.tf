# ------ KEY Pair ------

resource "aws_key_pair" "key_pair" {
  key_name   = "${var.env}-key"
  public_key = file(var.public_key_path)
  
}

# ------ Default VPC ------

resource "aws_default_vpc" "default" {
  
}


# ----------------Security Group ----------------

resource "aws_security_group" "default_vpc" {
    name = "${var.env}-security-group"
    vpc_id = aws_default_vpc.default.id
    description = "Allows SSH access and HTTP inbound to EC2 instances${var.env}"

    tags = merge(var.common_tags,{
        Name = "${var.env}-security-group"
    })
  
}


#--------------------- Ingress Rules ----------------

resource "aws_security_group_rule" "ssh" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.default_vpc.id
    description = "Allow SSH access from anywhere"
}

resource "aws_security_group_rule" "http" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.default_vpc.id
    description = "Allow HTTP access from anywhere"
}

# ----------------- Egress Rules ----------------

resource "aws_security_group_rule" "egress" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.default_vpc.id
    description = "Allow all outbound traffic"
}

# -------------------------- EC2 Instance ----------------

resource "aws_instance" "my_server_terraform" {
    count = var.instance_count

    ami = var.ami
    instance_type = var.instance_type
    key_name = aws_key_pair.key_pair.key_name
    vpc_security_group_ids = [aws_security_group.default_vpc.id]

    root_block_device {
        volume_size = 8
        volume_type = "gp2"
    }

    tags = merge(var.common_tags,{
        Name = "${var.env}-ec2-instance-${count.index + 1}"
    })
  

}