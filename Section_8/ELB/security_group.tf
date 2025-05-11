# Security Group for Levelup ELB

resource "aws_security_group" "levelup-elb-security_group" {
  vpc_id = aws_vpc.level_up_vpc.id
  name = "levelup-elb-security_group"
  description = "Security group for Elastic Load Balancer"

egress  {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
tags = {
  Name = "levelup-elb-security_group"
}

}
# Security Group for Levelup Instances

resource "aws_security_group" "levelup-instances" {
  vpc_id = aws_vpc.level_up_vpc.id
  name = "levelup-instances"
  description = "Security group for Instances "

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

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [ aws_security_group.levelup-elb-security_group.id ]
}
tags = {
  Name = "levelup-instances"
}

}
