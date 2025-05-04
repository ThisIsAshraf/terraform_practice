# Security Group for Levelup VPC

resource "aws_security_group" "allow-level_up_ssh" {
  vpc_id = aws_vpc.level_up_vpc.id
  name = "allow_level_up_ssh"
  description = "Security group to allow SSH Connection"

egress  {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
tags = {
  Name = "allow_level_up_ssh"
}

}

# Security Group for MariaDB C

resource "aws_security_group" "allow_mariadb" {
  vpc_id = aws_vpc.level_up_vpc.id
  name = "allow_mariadb"
  description = "Security group For Maria DB"

egress  {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [aws_security_group.allow-level_up_ssh.id]
}
tags = {
  Name = "allow_level_up_ssh"
}

}