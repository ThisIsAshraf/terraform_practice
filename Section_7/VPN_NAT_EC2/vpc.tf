# Create AWS VPC

resource "aws_vpc" "level_up_vpc" {

    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"

    tags = {
        Name = "level_up_vpc"
    }
}

# Public Subnet in Custom VPC

resource "aws_subnet" "level_up_vpc_public_1" {
  
  vpc_id = aws_vpc.level_up_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "level_up_vpc_public_1"
  }

}

resource "aws_subnet" "level_up_vpc_public_2" {
  
  vpc_id = aws_vpc.level_up_vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "level_up_vpc_public_2"
  }

}

resource "aws_subnet" "level_up_vpc_public_3" {
  
  vpc_id = aws_vpc.level_up_vpc.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "ap-southeast-1c"

  tags = {
    Name = "level_up_vpc_public_3"
  }

}

# Private Subnet

# Public Subnet in Custom VPC

resource "aws_subnet" "lavel_up_private_subnet1" {
  
  vpc_id = aws_vpc.level_up_vpc.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "lavel_up_private_subnet1"
  }

}

resource "aws_subnet" "lavel_up_private_subnet2" {
  
  vpc_id = aws_vpc.level_up_vpc.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "lavel_up_private_subnet2"
  }

}

resource "aws_subnet" "lavel_up_private_subnet3" {
  
  vpc_id = aws_vpc.level_up_vpc.id
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "ap-southeast-1c"

  tags = {
    Name = "lavel_up_private_subnet3"
  }

}

# Custom Internet Gateway

resource "aws_internet_gateway" "lavel_up_vpc_GW" {
  vpc_id = aws_vpc.level_up_vpc.id

  tags = {
    Name="lavel_up_vpc_GW"
  }
}

# Routing Table

resource "aws_route_table" "level_up_public" {
  vpc_id = aws_vpc.level_up_vpc.id

  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lavel_up_vpc_GW.id
    
  }

  tags = {
    Name = "level_up_public_1"
  }
}

# Routing Association

resource "aws_route_table_association" "level_up_public_1a" {
 subnet_id = aws_subnet.level_up_vpc_public_1.id
 route_table_id = aws_route_table.level_up_public.id
}

resource "aws_route_table_association" "level_up_public_2a" {
 subnet_id = aws_subnet.level_up_vpc_public_2.id
 route_table_id = aws_route_table.level_up_public.id
}

resource "aws_route_table_association" "level_up_public_3a" {
 subnet_id = aws_subnet.level_up_vpc_public_3.id
 route_table_id = aws_route_table.level_up_public.id
}