data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_instance" "WebServer" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[1]  # Now this works as it's a list

  tags = {
    Name = "Custom Image"
  }
}