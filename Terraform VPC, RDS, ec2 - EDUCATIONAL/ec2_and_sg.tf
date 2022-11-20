resource "aws_instance" "ps_public_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.public-sg.id]
  subnet_id              = element(aws_subnet.public_subnets[*].id, 0)
  key_name               = var.ssh_key

  user_data = <<EOF
#!/bin/bash
sudo echo -e "\nAllowAgentForwarding yes" >> /etc/ssh/sshd_config
sudo service sshd restart
sudo sudo systemctl restart ssh
EOF

  # you can use a command "file" to add the same strings
  # user_data = file("user_data")

  tags = {
    Name = "PS_Ter_PublicEC2"
  }
  depends_on = [aws_security_group.public-sg] # no need in this string here
}

/* You can deploy your ssh key directly and register it in aws
resource "aws_key_pair" "deployer" {
	key_name   = "deployer-key"
	public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2L#g9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}
*/

resource "aws_instance" "ps_private_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.private-sg.id]
  subnet_id              = element(aws_subnet.private_subnets[*].id, 0)
  key_name               = var.ssh_key
  #user_data = file("userdata_public.sh")
  tags = {
    Name = "PS_Ter_PrivateEC2"
  }
  depends_on = [aws_security_group.private-sg] # no need in this string here
}


resource "aws_security_group" "public-sg" {
  name        = "ps-ter-public-sg"
  vpc_id      = aws_vpc.main.id
  description = "Allow 22, 80, 443 traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "private-sg" {
  name        = "ps-ter-private-sg"
  vpc_id      = aws_vpc.main.id
  description = "Allow SSH and 5432 Postgres form local"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }
}
