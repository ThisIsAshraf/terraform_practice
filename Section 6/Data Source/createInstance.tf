resource "aws_instance" "WebServer" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"

  tags = {
    Name = "Custom Image"
  }

}