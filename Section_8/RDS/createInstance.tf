resource "aws_key_pair" "levelup_key" {
  key_name   = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "WebServer" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  availability_zone = "ap-southeast-1a"
  key_name      = aws_key_pair.levelup_key.key_name
  vpc_security_group_ids = [aws_security_group.allow-level_up_ssh.id]
  subnet_id = aws_subnet.level_up_vpc_public_1.id



  tags = {
    Name = "Custom Image"
  }


}

# Extract the Public IP of EC2

output "public_ip" {
  value = aws_instance.WebServer.public_ip
}