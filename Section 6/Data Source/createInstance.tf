data "aws_availability_zone" "available" {

}

resource "aws_instance" "WebServer" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  availability_zone = data.aws_availability_zone.available.name[1]

  tags = {
    Name = "Custom Image"
  }

}